# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# kod za railcastem <http://railscasts.com/episodes/197-nested-model-form-part-2>
# with Turbolinks its mandatory to delegate event binding to document object
$(document).on 'click', 'form button.remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('.fields').transition 
    animation: 'scale'
    onComplete: ->
      $(@).hide()

$(document).on 'click', 'form .add_components', (event) ->
  $wellDiv = $('form .ui.attached.segment')
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $wellDiv.append($(this).data('fields').replace(regexp, time))
  event.preventDefault()