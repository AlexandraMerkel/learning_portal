@form_reset = ->
  $(".form-reset").on 'click', ->
    $(this).parent().children(".form-control").val('')
    $(this).parent().children(".form-control").selectpicker('deselectAll')
    false
dtpick = ->
  $('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})
  false
@datepicker_activation = ->
  window.datepicker_activation_by_item($(document))
@datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})
@bs = ->
  window.bs_item($(document))
@bs_item = (item)->
  item.find('.selectpicker').selectpicker()
  item.find('.selectpicker[data-value]').each ->
    $(this).selectpicker 'val', $(this).data('value')
    false
loaderf = ->
  $('.long, .longpaginate .page a, .longpaginate .next a, .longpaginate .prev a, .longpaginate .last a, .longpaginate .first a').on 'click', ->
    $('#loader').modal('show')
    true
  true

ready = ->
  loaderf()
  dtpick()
  bs()
  form_reset()
  false

$(document).on 'turbolinks:load', ready
