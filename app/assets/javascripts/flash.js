(function ($) {
    $(document).on('ajax:complete', function (event) {
        let alert_type, msg;
        let request = event.detail[0];
        msg = request.getResponseHeader("X-Message");
        alert_type = 'alert-success';
        if (request.getResponseHeader("X-Message-Type").indexOf("error") !== -1) {
            alert_type = 'alert-error';
        }
        if (request.getResponseHeader("X-Message-Type").indexOf("keep") !== 0) {
            if (msg) {
                return $(".messages").append("<div class='alert " + alert_type + "'><button type='button' class='close' data-dismiss='alert'>&times;</button>" + msg + "</div>");
            }
        }
    });

})(jQuery);