let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  current_year = require('../helpers/current_year'),
  sponsorsList = require('../helpers/sponsors'),
  i18n = require('i18n');
exports.index = function(req, res){
  res.render('sponsors', {
    nav: nav(req),
    footer: footer(req),
    current_year: current_year,
    sponsor_title: req.t('sponsors'),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    wristbands: req.t('wristbands'),
    sponsors: sponsorsList(req)
  });
};