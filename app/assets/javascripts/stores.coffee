# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $("#geocomplete").geocomplete {
    map: ".map_canvas"
    details: "form"
    detailsAttribute: "data-geo"
    types: ["geocode", "establishment"]
    location: [$("#store_lat").val(), $("#store_lng").val()]
  }

