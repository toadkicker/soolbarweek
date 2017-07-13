let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  i18n = require('i18n');
exports.index = function(req, res){
  res.render('thankyou', {
    nav: nav(req),
    footer: footer(req),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    message_sent_text: req.t('message_sent_text')
  });
};

exports.post = function (req, res) {
  res.redirect('/thankyou')
  //TODO: for processing the contact form
};