@del_cu_body_f = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1") // test
    link.parent().closest('.add-fields').hide()
    false
@del_cu_f = ->
  $('a.remove_cu').on 'click', ->
    window.del_cu_body_f($(this))
    false
  false
@add_cu_f = ->
  $('#add_cu_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_community_user", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).closest('.row').after(content)
    panel = $(this).closest('.community_users').find('.add-fields')[0]
    window.activate_cu_f(panel)
    false
@activate_cu_f = (panel)->
  $(panel).find('a.remove_cu').on 'click', ->
    window.del_cu_body_f($(this))
    false
  true

community_users_ready = ->
  window.del_cu_f()
  window.add_cu_f()

$(document).on 'turbolinks:load', community_users_ready