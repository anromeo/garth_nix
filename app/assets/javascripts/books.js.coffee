# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
 
  $(".book").on 'mouseover', ->
    $this = $(@)
    $this.children(".description").stop(true, true).slideToggle()

  $(".book").on 'mouseout', ->
    $this = $(@)
    $this.children(".description").stop(true, true).slideToggle()
)