# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
  $(".universes-link").on 'click', "", (clicked)->
    $this = $(@)
    clicked.preventDefault()

  $(".universe-div").on 'click', ->
    $this = $(@)
    $this.removeClass("universe-div").addClass("universe-div-clicked").animate({"z-index": 1, "padding": "10px"}, 1000)
    $this.children(".universe-button-div").show()

  $(".universe-button-div button").on 'click', ->
    $this = $(@)
    $this.parent("div").parent(".universe-div-clicked").removeClass("universe-div-clicked").addClass("universe-div").animate({"z-index": 0, "padding": 0}, 1000)
)