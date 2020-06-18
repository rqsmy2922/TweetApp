$ ->
  ref = document.referrer
  unless ref
    window.location.href = '../tweets'
    