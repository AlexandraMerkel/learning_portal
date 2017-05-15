@update_mark_f = ->
  $(".mark_editable").focus ->
    $(this).css("border", "1px solid #9E7570")
  $(".mark_editable").blur ->
    id = $(this).attr('data-id')
    student_id = $(this).attr('data-student-id')
    teacher_id = $(this).attr('data-teacher-id')
    ds_id = $(this).attr('data-ds-id')
    old_value = $(this).attr('data-old_value')
    new_value = $(this).text().trim()
    url = $(this).attr('data-url')
    if old_value != new_value
      $.ajax({
        url: url,
        type: 'GET',
        data: {mark_value: new_value, id: id, student_id: student_id, teacher_id: teacher_id, discipline_section_id: ds_id}
        })
      $(this).attr('data-old_value', new_value)
    $(this).css("border", "0px")

marks_ready = ->
  update_mark_f()

$(document).on 'turbolinks:load', marks_ready