# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
sbw_affix = ->
  $header = $('#header')
  $footer = $('footer')
  $navbar = $('.navbar')
  if $header.outerHeight() == undefined
    $navbar.affix top: $header.outerHeight()
    $('#sidemenu').affix offset:
      top: $navbar.outerHeight()
      bottom: $footer.outerHeight() - 200
  else
    $navbar.affix offset:
      top: $header.outerHeight()
      bottom: $header.outerHeight() - 50
    $('#sidemenu').affix offset:
      top: $header.outerHeight()
      bottom: $footer.outerHeight() + 50
  return

((d) ->
  config =
    kitId: 'bfw1lgm'
    scriptTimeout: 3000
    async: true
  h = d.documentElement
  t = setTimeout((->
    h.className = h.className.replace(/\bwf-loading\b/g, '') + ' wf-inactive'
    return
  ), config.scriptTimeout)
  tk = d.createElement('script')
  f = false
  s = d.getElementsByTagName('script')[0]
  a = undefined
  h.className += ' wf-loading'
  tk.src = 'https://use.typekit.net/' + config.kitId + '.js'
  tk.async = true
  tk.onload =
    tk.onreadystatechange = ->
      a = @readyState
      if f or a and a != 'complete' and a != 'loaded'
        return
      f = true
      clearTimeout t
      try
        Typekit.load config
      catch e
      return

  s.parentNode.insertBefore tk, s
  return
) document
$(document).on 'ready', sbw_affix()
((i, s, o, g, r, a, m) ->
  i['GoogleAnalyticsObject'] = r
  i[r] = i[r] or ->
    (i[r].q = i[r].q or []).push arguments
    return

  i[r].l = 1 * new Date
  a = s.createElement(o)
  m = s.getElementsByTagName(o)[0]
  a.async = 1
  a.src = g
  m.parentNode.insertBefore a, m
  return
) window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga'
ga 'create', 'UA-103575478-1', 'auto'
ga 'send', 'pageview'