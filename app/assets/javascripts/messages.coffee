get_message_f = ->
  user = $('body').first().attr('data-username')
  MessageBus.subscribe "/message", (msg)->
    if msg.username == user
      alert(msg.data.message)
    else
      alert(user)
    true
  true
  
get_user_enterance_f = ->
  MessageBus.subscribe "/presence", (msg)->
    if msg.enter
      alert(msg.enter)
    else
      alert(msg.leave)
    true
  true

msg_ready = ->
  get_message_f()
  get_user_enterance_f()
  
$(document).on 'turbolinks:load', msg_ready


