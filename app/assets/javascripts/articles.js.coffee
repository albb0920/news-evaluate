$ ->
  original_form = $('.add-comment-marker').clone()

  # load all comments
  rangy.addInitListener ->
    marker_comments.sort (a,b)->
      a_top = rangy.deserializeRange(a.selection, $('.content')[0]).getStartDocumentPos()
      b_top = rangy.deserializeRange(b.selection, $('.content')[0]).getStartDocumentPos()

      switch
        when a_top < b_top then -1
        when a_top > b_top then  1
        else 0

    for comment in marker_comments
      old_selection = null

      $('<div>')
        .html(comment.comment).appendTo('#marker-comments')
        .data('selection', comment.selection)
        .hover(
          ->
            old_selection = rangy.saveSelection()
            rangy.deserializeSelection $(this).data('selection'), $('.content')[0]
          ->
            rangy.restoreSelection old_selection
        )


    $('.toggle-title-issue').bind 'ajax:before', ->
      $(this).toggleClass('on')

    $('.add-comment-marker').mouseup (e)->
      e.stopPropagation()

    $(document).mouseup ->
      unless rangy.getSelection().toString().length
        $('.add-comment-marker').css('display', 'none')
        return

    $('.content').mouseup (e)->
      return unless rangy.getSelection().toString().length

      $('.add-comment-marker')
        .css('display', 'block')
        .css('top', e.pageY + 'px')
        .css('left', e.pageX + 'px')

      $('#marker_comment_selection').attr('value', rangy.serializeSelection(null, false, $('.content')[0]))
