# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  
$(document).on 'turbolinks:load', ->
  $('#log_account_id').change ->
    $.get url: "/categories/categories", data: {account_id: $('#log_account_id').has('option:selected').val()}, ->
      $.get url: "/sub_categories/sub_categories", data: { category_id: $('#category_category_id').has('option:selected').val() }, ->
        $.get url: "/last_store", data: { sub_category_id: $('#log_sub_category_id').val() }
  $('#category_category_id').change ->
    $.get url: "/sub_categories/sub_categories", data: { category_id: $('#category_category_id').has('option:selected').val() }, ->
      $.get url: "/last_store", data: { sub_category_id: $('#log_sub_category_id').val() }
  $('#log_sub_category_id').change ->
    $.get url: "/last_store", data: { sub_category_id: $('#log_sub_category_id').has('option:selected').val() }
  $('.toggle-search-cond').click ->
    $('.search-cond').toggle()
  $('.search-cond').hide()

