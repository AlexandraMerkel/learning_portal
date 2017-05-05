# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  # console.log 'bbb'
  $('#rankTable').DataTable
    language:
      # url: '/app/assets/javascripts/datatables/Russian.json'
      oPaginate:
        sNext: "След"
        sPrevious: "Пред"
        sFirst:"Первая",
        sLast:"Последняя"
      search: "Поиск:"
      sInfo:" _START_ - _END_ из _TOTAL_ строк"
      sInfoEmpty:" 0 - 0 из 0 строк"
      sLengthMenu:"Показать _MENU_ строк"
      sRowEmpty:"Таблица пуста"
      sProcessing: "Подождите..."
      infoFiltered: "(отфильтровано из _MAX_ строк)"
      loadingRecords: "Загрузка записей..."
      zeroRecords: "Записи отсутствуют."
      aria:
        sortAscending: ": активировать для сортировки столбца по возрастанию"
        sortDescending: ": активировать для сортировки столбца по убыванию"








