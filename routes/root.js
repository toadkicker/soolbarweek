let nav = require('../helpers/nav'),
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
    learn_more: req.t('learn_more'),
    nav: nav(req),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    date: req.t('date'),
    footer: [
      {
        footer_links: nav(req),
        column_class: 'col-md-3 col-sm-6 pl-0'
      },
      {
        footer_links: [
          {
            title: req.t('contact_us'),
            url: "/contact"
          }
        ],
        column_class: 'col-md-3 col-sm-6 pl-0'
      },
      {
        footer_links: [
          {
            icon: 'fa fa-pinterest fa-lg',
            url: "https://pinterest.com"
          },
          {
            icon: 'fa fa-twitter fa-lg',
            url: "https://twitter.com"
          },
          {
            icon: 'fa fa-instagram fa-lg',
            url: "https://instagram.com"
          },
          {
            icon: 'fa fa-facebook fa-lg',
            url: "https://facebook.com"
          },
          {
            icon: 'fa fa-skype fa-lg',
            url: "https://skype.com"
          },
        ],
        column_class: 'col-md-4 ml-auto text-right'
      }
    ],
    aside_links: [
      {
        title: "One",
        url: "#sec1",
        sublinks: [
          {
            title: "Sec A",
            url: "#sec1a"
          }
        ]
      }
    ]
  });
};