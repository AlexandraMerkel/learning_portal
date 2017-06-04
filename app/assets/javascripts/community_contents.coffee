cc_editor = ->
  $('#community_content_content_body').summernote();

cc_ready = ->
  cc_editor()
  false

$(document).on 'turbolinks:load', cc_ready
