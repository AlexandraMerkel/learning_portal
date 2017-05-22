$('#message_message_content').val("")
$('#messages_index').load location.href + ' #messages_index'
$.bootstrapGrowl("Cообщение отправлено", {type: 'success'})