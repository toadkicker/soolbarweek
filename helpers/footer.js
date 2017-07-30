//This is just so we dont have footer items in every route file
let nav = require('./nav'),
  sponsorsList = require('../helpers/sponsors');
module.exports = function (req) {
  return [
    {
      footer_links: nav(req),
      nav_class: 'flex-column',
      column_class: 'col-md-3 col-sm-6 pl-0'
    },
    {
      footer_links: [
        {
          title: req.t('contact_us'),
          url: "/contact"
        },
        {
          title: req.t('about'),
          url: "/about"
        },
        {
          title: req.t('privacy'),
          url: "/privacy"
        },
        {
          title: req.t('tos'),
          url: "/terms-of-service"
        }
      ],
      nav_class: 'flex-column',
      column_class: 'col-md-3 col-sm-6 pl-0'
    },
    {
      footer_links: [
        {
          icon: 'fa fa-instagram fa-lg',
          url: "https://instagram.com/soolbarweek"
        },
        {
          icon: 'fa fa-facebook fa-lg',
          url: "https://facebook.com/soolbarweek"
        }
      ],
      nav_class: 'flex-row justify-content-end',
      column_class: 'col-md-4 ml-auto text-right'
    }
  ];

};