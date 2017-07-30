let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  current_year = require('../helpers/current_year'),
  i18n = require('i18n');
exports.index = function(req, res){
  res.render('contact', {
    nav: nav(req),
    footer: footer(req),
    current_year: current_year,
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    wristbands: req.t('wristbands'),
    name: req.t('name'),
    email: req.t('email'),
    message: req.t('message')
  });
};

exports.post = function (req, res) {
  res.redirect('/thankyou')
  //TODO: for processing the contact form
};