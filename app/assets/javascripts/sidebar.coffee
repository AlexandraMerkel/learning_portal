sbtoggle = ->
  $("#sidebar-toggle").on 'click', ->
    id=$(this).children('.sidebar-toggle').attr 'href'
    $(id).toggleClass 'toggled'
    false
togglef = ->
  $(".with-subitems").on 'click', ->
    $(this).parent().children(".subitems").toggle(300)
    false
sidebar_ready = ->
  sbtoggle()
  togglef()
  false
$(document).on 'turbolinks:load', sidebar_ready