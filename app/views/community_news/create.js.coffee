$('#community_news_news_body').val("")
$('#newses_index').load location.href + ' #newses_index'
$.bootstrapGrowl("Новость успешно создана", {type: 'success'})