let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  i18n = require('i18n');

exports.index = function (req, res) {
  res.render('index', {
    current_year: function () {
      d = new Date();
      return d.getFullYear();
    },
    logo_alt: req.t("logo_alt"),
    header: {
      title: req.t('title'),
      date: req.t('date'),
    },
    right_column: true,
    learn_more: req.t('learn_more'),
    nav: nav(req),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    date: req.t('date'),
    footer: footer(req)
  });
};