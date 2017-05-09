@update_mark_f = ->
  $(".mark_editable").blur ->
    id = $(this).attr('data-id')
    student_id = $(this).attr('data-student_id')
    ds_id = $(this).attr('data-ds_id')
    old_value = $(this).attr('data-old_value')
    new_value = $(this).text().trim()
    url = $(this).attr('data-url')
    if old_value != new_value
      $.ajax({
        url: url,
        type: 'GET',
        data: {mark_value: new_value, id: id, student_id: student_id, ds_id: ds_id}
        })
      $(this).attr('data-old_value', new_value)

marks_ready = ->
  update_mark_f()

$(document).on 'turbolinks:load', marks_ready