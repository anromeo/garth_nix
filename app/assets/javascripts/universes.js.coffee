# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
  $(".universes-link").on 'click', "", (clicked)->
    $this = $(@)
    clicked.preventDefault()
    children = $this.children()

    children.removeClass("universe-div").addClass("universe-div-clicked").animate({"width": "50%", "z-index": 1, "padding": "10px"}, 1000)
)