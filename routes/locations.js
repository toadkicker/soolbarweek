let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  i18n = require('i18n');
exports.index = function (req, res) {
  res.render('locations', {
    nav: nav(req),
    footer: footer(req),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    mapbox_token: "pk.eyJ1IjoidG9hZGtpY2tlciIsImEiOiJjajUyNG50eDMwY2IyMnFwOWU3M2M1OXFnIn0.8yWFA9xzL8jAj_1l5H-Eqg",
    locations: [
      {
        "name": "Chapter One",
        "lat":"37.522763018618",
        "lng": "127.02117919922"
      },
      {
        "name":"B28 Seoul",
        "lat": "37.5178873",
        "lng": "126.8925626"
      }
    ]
  });
};