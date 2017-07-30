let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  current_year = require('../helpers/current_year'),
  i18n = require('i18n');

exports.index = function(req, res, config){
  res.render('events', {
    nav: nav(req),
    current_year: current_year,
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    login_form_url: config.api_url + "/auth"
  });
};