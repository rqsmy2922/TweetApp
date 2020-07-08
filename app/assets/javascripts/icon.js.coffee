$('#icon').on 'change', (e) ->
  reader = new FileReader
  reader.onload = (e) ->
    $('#icon_preview').attr 'src', e.target.result
    return
  reader.readAsDataURL e.target.files[0]
  return