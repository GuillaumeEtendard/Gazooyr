# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.onload = ->
  review_text = $('#gazooy_text')
  counter = $('#gazooy_counter')
  max_length = counter.data('maximum-length')
  if review_text.length > 0
    review_text.keyup ->
      counter.text max_length - ($(this).val().length)
      return
  return