let nav = require('../helpers/nav'),
  i18n = require('i18n');
exports.index = function(req, res){
  res.render('registration', {
    nav: nav(req),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in')
  });
};