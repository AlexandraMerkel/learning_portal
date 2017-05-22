# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

numbers = new Bloodhound(
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('num')
  queryTokenizer: Bloodhound.tokenizers.whitespace
  local: [
    { num: 'one' }
    { num: 'two' }
    { num: 'three' }
    { num: 'four' }
    { num: 'five' }
    { num: 'six' }
    { num: 'seven' }
    { num: 'eight' }
    { num: 'nine' }
    { num: 'ten' }
  ])

numbers.initialize()

$('.users_message').typeahead null,
  displayKey: 'num'
  source: numbers.ttAdapter()

# $('.users_message').tagsinput typeaheadjs:
#   name: 'citynames'
#   displayKey: 'name'
#   valueKey: 'name'
#   source: numbers.ttAdapter()
