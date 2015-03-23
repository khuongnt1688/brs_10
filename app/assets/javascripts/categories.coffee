jQuery ->
  $('#categories_search').submit( ->
    $.get(this.action, $(this).serialize(), null, 'script')
    false
  )

  $('#categories_search input').keyup( ->
    $.get($("#categories_search").attr("action"), $("#categories_search").serialize(), null, 'script')
    false
  )