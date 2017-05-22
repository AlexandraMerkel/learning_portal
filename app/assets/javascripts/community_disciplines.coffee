# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@del_dis_body_f = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().closest('.add-dis-fields').hide()
    false
@del_dis_f = ->
  $('a.remove_dis').on 'click', ->
    window.del_dis_body_f($(this))
    false
  false
@add_dis_f = ->
  $('#add_dis_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_community_discipline", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).closest('.row').after(content)
    panel = $(this).closest('.community_disciplines').find('.add-fields')[0]
    window.activate_dis_f(panel)
    false
@activate_dis_f = (panel)->
  $(panel).find('a.remove_dis').on 'click', ->
    window.del_dis_body_f($(this))
    false
  true

community_disciplines_ready = ->
  window.del_dis_f()
  window.add_dis_f()

$(document).on 'turbolinks:load', community_disciplines_ready