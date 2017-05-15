#alert 'Новость удалена'
$('#newses_index').load location.href + ' #newses_index'
$.bootstrapGrowl("Новость успешно удалена", {type: 'success'})