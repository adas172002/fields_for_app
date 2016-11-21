module ApplicationHelper
  def link_to_add_fields(name, f, association, locals = {}, html_class = "")
  
  # name => name of link
  # f => form builder
  # association => nested object
  # locals => locals to be passed into 
  # html_class => html to append to link_to rails method
  
    new_object = f.object.class.reflect_on_association(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", locals.merge!(association.to_s.singularize.to_sym => builder))
    end
    link_to(name, '#', class: "add_#{association.to_s} " << html_class, data: {id: id, fields: fields.gsub("\n", "")})
  end
end
