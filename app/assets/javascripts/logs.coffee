# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  
$(document).on 'turbolinks:load', ->
  $('#category_category_id').change ->
    $.get url: "/sub_categories/sub_categories", data: { category_id: $('#category_category_id').has('option:selected').val() }

