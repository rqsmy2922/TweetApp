$ ->
  $('.tab-label').click ->
    index = $('.tab-wrap div').index(this)
    $('.tab-wrap div').removeClass 'select'
    $('.tab-content').addClass 'hide'
    $('.tab-content').eq(index).removeClass 'hide'
    $(this).addClass 'select'

$ ->
  hash = location.hash
  hash = (hash.match(/^#tab\d+$/) or [])[0]
  if $(hash).length
    tabname = hash.slice(1)
  else
    tabname = 'tab1'
  $('.tab-wrap div').removeClass 'select'
  $('.tab-content').addClass 'hide'
  tabno = $('.tab-wrap div#' + tabname).index()
  $('.tab-content').eq(tabno).removeClass 'hide'
  $('.tab-wrap div').eq(tabno).addClass 'select'