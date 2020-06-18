$('div.image-space').each ->
  num = $(this).find('a img').length
  if num == 1
    $(this).find('a img').removeClass 'image1'
    $(this).find('a img').addClass 'image1'
  else if num == 2
    $(this).find('a img').removeClass 'image1'
    $(this).find('a img').addClass 'image2'
  else if num == 3
    $(this).find('a img').removeClass 'image1'
    $(this).find('a').eq(0).addClass 'image2'
    $(this).find('a img').eq(0).addClass 'image2'
    $(this).find('a').eq(1).addClass 'image3'
    $(this).find('a img').eq(1).addClass 'image3'
    $(this).find('a').eq(2).addClass 'image3'
    $(this).find('a img').eq(2).addClass 'image3'
  else
    $(this).find('a img').removeClass 'image1'
    $(this).find('a').addClass 'image3'
    $(this).find('a img').addClass 'image3'
return