$(document).ajaxComplete (event, request) ->
  msg = request.getResponseHeader("X-Message")
  alert_type = 'alert-success'
  alert_type = 'alert-error' unless request.getResponseHeader("X-Message-Type").indexOf("error") is -1

  unless request.getResponseHeader("X-Message-Type").indexOf("keep") is 0
  #add flash message if there is any text to display
    $(".messages").append("<div class='alert " + alert_type + "'><button type='button' class='close' data-dismiss='alert'>&times;</button>" + msg + "</div>") if msg