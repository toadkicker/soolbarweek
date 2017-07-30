let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  current_year = require('../helpers/current_year'),
  i18n = require('i18n');

exports.privacy = function(req, res){
  res.render('privacy', {
    nav: nav(req),
    footer: footer(req),
    current_year: current_year,
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    name: req.t('name'),
    email: req.t('email'),
    message: req.t('message'),
    privacy: req.t('privacy')
  });
};

exports.tos = function(req, res){
  res.render('tos', {
    nav: nav(req),
    footer: footer(req),
    current_year: current_year,
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    name: req.t('name'),
    email: req.t('email'),
    message: req.t('message'),
    tos: req.t('tos')
  });
};