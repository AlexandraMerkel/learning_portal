# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@hide_ds_form = ->
  $('#new_ds_form').hide()
  $('#submitDisSection').on 'click', ->
    $('#new_ds_form').hide()

@show_ds_form = ->
  $('#new_ds').on 'click', ->
    if $('#new_ds_form').is(":hidden")
      $('#new_ds_form').show()
      $('html, body').animate({scrollTop: $('#new_ds_form').position().top},1000)
    else
      $('#new_ds_form').hide()

discipline_sections_ready = ->
  window.hide_ds_form()
  window.show_ds_form()

$(document).on 'turbolinks:load', discipline_sections_ready