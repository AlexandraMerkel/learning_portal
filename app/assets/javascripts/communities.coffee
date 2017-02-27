# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

adding_fields = ->
  $('.add-users').click ->
    $('.add-fields').toggle()
$(document).ready adding_fields
$(document).on 'page:load', adding_fields