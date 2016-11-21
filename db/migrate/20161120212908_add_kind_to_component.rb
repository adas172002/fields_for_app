class AddKindToComponent < ActiveRecord::Migration
  def change
    add_column :components, :kind, :string
  end
end
