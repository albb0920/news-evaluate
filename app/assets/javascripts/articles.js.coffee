$ ->
  $('.toggle-title-issue').bind 'ajax:before', ->
    $(this).toggleClass('on')
