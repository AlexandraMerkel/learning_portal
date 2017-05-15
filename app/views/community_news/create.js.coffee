#alert 'qqq'
###console.log('qqqqq')###

#parent.document.getElementById("list-of-news").reload()

$('#community_news_news_body').val("")
$('#newses_index').load location.href + ' #newses_index'
$.bootstrapGrowl("Новость успешно создана", {type: 'success'})

#notice 'Новость опубликована'