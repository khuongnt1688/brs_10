jQuery ->
  $('#books_search').submit( ->
    $.get(this.action, $(this).serialize(), null, 'script')
    false
  )

  $('#books_search input').keyup( ->
    $.get($("#books_search").attr("action"), $("#books_search").serialize(), null, 'script')
    false
  )