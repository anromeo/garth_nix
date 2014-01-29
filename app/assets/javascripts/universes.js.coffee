# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
  $(".universes-link").contents().unwrap()

  $(".universe-div").on 'click', ->
    if $(".universe-button-div").is(":hidden")
      $this = $(@)
      $this.removeClass("universe-div").addClass("universe-div-clicked").animate({"padding": "10px"}, 1000)
      $(".universe-button-div").show()
      $this.child(".content").show()

  $("#universe-exit").on 'click', ->
    $this = $(@)
    $(".universe-div-clicked").removeClass("universe-div-clicked").addClass("universe-div").animate({"padding": 0}, 1000)
    $this.parent("div").hide()
)