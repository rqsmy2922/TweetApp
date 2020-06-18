$ ->
  CookieName2 = Cookies.get('contents2')
  if CookieName2 != null
    $ ->
      $('.tab-label').removeClass 'select'
      $('.tab-content').removeClass 'select'
      $('.search_wap').removeClass 'select'
      $('.tab-wrap div#' + CookieName2).addClass 'select'

$ ->
  $('.tab-label').click ->
    tabhash = $(this).attr('id')
    $('.tab-label').removeClass 'select'
    $('.tab-content').removeClass 'select'
    $('.search_wap').removeClass 'select'
    $('.tab-wrap div#' + tabhash).addClass 'select'
    Cookies.set 'contents2', $(this).attr('id'), secure: true, expires: 1
  
$ ->
  hash = location.hash
  hash = (hash.match(/^#tab\d+$/) or [])[0]
  if $(hash).length
    tabname = hash.slice(1)
  else
    tabname = 'tab1'
  $('.tab-label').removeClass 'select'
  $('.tab-content').removeClass 'select'
  $('.search_wap').removeClass 'select'
  tabno = $('.tab-label#' + tabname).index()
  $('.tab-content').eq(tabno).addClass 'select'
  $('.tab-label').eq(tabno).addClass 'select'
  $('.search_wap').eq(tabno).addClass 'select'
  