# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#  $('#message_list_users').tagsinput({
  #    typeaheadjs: {
  #        name: 'users',
  #        displayKey: 'value',
  #        source: users.ttAdapter()
  #    }
  #  })
#

#start_tagsinput_f = ->
#  $("[data-role=tagsinput]").each ->
#    url = '/users.json'
#    bloodhound_opts =
#      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value')
#      queryTokenizer: Bloodhound.tokenizers.whitespace
#      remote: "#{url}?query=%QUERY"
#    typeahead = new Bloodhound bloodhound_opts
#    typeahead.initialize()
#    console.log(typeahead.ttAdapter())
#    opts =
#      tagClass: 'label label-default'
#      itemValue: 'id'
#      itemText: 'full_name'
#      typeaheadjs:
#        name: 'users'
#        displayKey: 'full_name'
#        source: typeahead.ttAdapter
#    $(this).tagsinput opts

start_tagsinput_f = ->
  $('.tagsInput').tagsinput({
    itemValue: 'id',
    itemText: 'text',
    typeahead: {
      displayKey: 'text',
      source: (query)->
        return $.get('/users.json')
      ,
      afterSelect: ->
        this.$element[0].value = ''
    }
  })
    
$(document).on 'turbolinks:load', ->
  start_tagsinput_f()
