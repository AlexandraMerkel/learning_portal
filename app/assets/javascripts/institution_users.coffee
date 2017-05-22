@del_iu_body_f = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().closest('.add-fields').hide()
    false
@del_iu_f = ->
  $('a.remove_iu').on 'click', ->
    window.del_iu_body_f($(this))
    false
  false
@add_iu_f = ->
  $('#add_iu_link').on 'click', ->
    #selected_role  = $('.role :selected').text().trim()
    #if selected_role == "Студент"
    #  $('.institution_users').hide()
    #else
    new_id = new Date().getTime()
    regexp = new RegExp("new_institution_user", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).closest('.row').after(content)
    panel = $(this).closest('.institution_users').find('.add-fields')[0]
    window.activate_iu_f(panel)
    false
@remove_fields_if_student = ->
  $('.role').on 'change', ->
    selected_role  = $('.role :selected').text().trim()
    if selected_role == "Студент"
      $('.institution_users').hide()
      # как сделать disabled
      #$('.institution_users :select').prop("disabled", true)
      $('#selector_institution').attr("disabled","disabled")
    else
      $('.institution_users').show()
      $('#selector_institution').removeAttr("disabled")
      #$('.institution_users').children("select").prop("disabled", false)
@activate_iu_f = (panel)->
  $(panel).find('a.remove_iu').on 'click', ->
    window.del_iu_body_f($(this))
    false
  true

institution_users_ready = ->
  window.del_iu_f()
  window.add_iu_f()
  window.remove_fields_if_student()

$(document).on 'turbolinks:load', institution_users_ready