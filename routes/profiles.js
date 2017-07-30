let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  profiles = require('../helpers/profiles'),
  current_year = require('../helpers/current_year'),
  moment = require('moment'),
  i18n = require('i18n');

exports.index = function (req, res) {

  res.render('profiles', {
    current_year: current_year,
    logo_alt: req.t("logo_alt"),
    nav: nav(req),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    date: req.t('date'),
    footer: footer(req),
    profiles: profiles(req)
  });
};

exports.show = function (req, res) {

  function getProfile(id) {
    let p = profiles(req);
    let filtered = p.filter(function (i) {
      return i.id === id;
    });
    return filtered[0]
  }

  res.render('profile', {
    current_year: current_year,
    logo_alt: req.t("logo_alt"),
    nav: nav(req),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    date: req.t('date'),
    footer: footer(req),
    profile: getProfile(req.params.id)
  });
};