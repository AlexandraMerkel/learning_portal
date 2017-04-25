ready = ->
  $(".growl-msg").each ->
    type=$(this).data('type') || 'info'
    if type == 'danger'
      $.bootstrapGrowl $(this).html(),
        type: type
        delay: 0
    else
      $.bootstrapGrowl $(this).html(),
        type: type
        delay: 1000
$(document).on 'turbolinks:load', ready