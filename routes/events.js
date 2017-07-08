let nav = require('../helpers/nav'),
  i18n = require('i18n');

exports.index = function(req, res, config){
  res.render('events', {
    nav: nav(req),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    event_form_url: config.api_url + "/orders",
    events: [
      {
        image_url: "/images/monsbar.png",
        image_alt: "Event 1 Mockup Logo",
        title: "Event Mockup 1",
        description: "This is a fake event we use for testing",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {
        video_url: "/images/homepage.mov",
        video_image_url: "/images/homestill.jpg",
        image_alt: "Event 2 Mockup Logo",
        title: "Event Mockup 2",
        description: "This is a fake event we use for testing",
        submit_button: "Buy Tickets",
      },
    ]
  });
};