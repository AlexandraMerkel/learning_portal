get_message_f = ->
  user = $('body').first().attr('data-username')
  MessageBus.subscribe "/message", (msg)->
    if msg.username == user
      #alert(msg.data.message)
      #alert("Вы отправили сообщение")
      #$('#messages_index').load location.href + ' #messages_index'
    else
      #$('#messages_index').load location.href + ' #messages_index'
      #alert('Сообщение пришло')
    true
  true

get_user_enterance_f = ->
  MessageBus.subscribe "/presence", (msg)->
    if msg.enter
      #alert(msg.enter)
      $('#user' + msg.id).css('background', '#B2DC56')
    else
      #alert(msg.leave)
      $('#user' + msg.id).css('background', '#f76447')
    true
  true

msg_ready = ->
  get_message_f()
  get_user_enterance_f()

$(document).on 'turbolinks:load', msg_ready


