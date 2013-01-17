$ ->
  original_form = $('.add-comment-marker').clone()
  $('#marker_comment_content_issue_ids').select2(width: '100%')

  # load all comments
  rangy.addInitListener ->
    marker_comments.sort (a,b)->
      a_top = rangy.deserializeRange(a.selection, $('.content')[0]).getStartDocumentPos().y
      b_top = rangy.deserializeRange(b.selection, $('.content')[0]).getStartDocumentPos().y

      switch
        when a_top < b_top then -1
        when a_top > b_top then  1
        else 0

    for comment in marker_comments
      old_selection = null
      if comment.content_issues_string.length
        issues_html = "<span>#{comment.content_issues_string.join('</span><span>')}</span>"
      else
        issues_html = ""

      $('<div class="marker-comment">')
        .html("#{issues_html}<div>#{comment.comment}</div>").appendTo('#marker-comments')
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

      #$('.new_marker_comment').bind 'ajax:before', ->
        #$('.add-comment-marker').css('display', 'none')

    $('.add-comment-marker').mouseup (e)->
      e.stopPropagation()

    $(document).mouseup ->
      # the selection won't be canceled unless default handler was benn run
      setTimeout ->
        unless rangy.getSelection().toString().length
          $('.add-comment-marker').css('display', 'none')
      , 0

    $('.content').mouseup (e)->
      return unless rangy.getSelection().toString().length

      $('.add-comment-marker')
        .css('display', 'block')
        .css('top', e.pageY + 'px')
        .css('left', e.pageX + 'px')

      $('#marker_comment_selection').attr('value', rangy.serializeSelection(null, false, $('.content')[0]))
