let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  i18n = require('i18n');
exports.index = function(req, res){
  res.render('about', {
    nav: nav(req),
    footer: footer(req),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    about: {
      profile_img: "/images/bio/Bob Louison.jpg",
      profile_text: req.t('profile_text')
    }
  });
};