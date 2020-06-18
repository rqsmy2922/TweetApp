$ ->
  count = $('.js-text').text().replace(/\n/g, '改行').length
  now_count = 140 - count
  if count > 140
    $('.js-text-count').css 'color', 'red'
  $('.js-text-count').text '残り' + now_count + '文字'
  $('.js-text').on 'keyup', ->
    `var count`
    `var now_count`
    count = $(this).val().replace(/\n/g, '改行').length
    now_count = 140 - count
    if count > 140
      $('.js-text-count').css 'color', 'red'
    else
      $('.js-text-count').css 'color', 'black'
    $('.js-text-count').text '残り' + now_count + '文字'
    return
  return