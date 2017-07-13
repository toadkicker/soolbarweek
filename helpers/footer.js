//This is just so we dont have footer items in every route file
let nav = require('./nav');

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
        }
      ],
      nav_class: 'flex-column',
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
      nav_class: 'flex-row justify-content-end',
      column_class: 'col-md-4 ml-auto text-right'
    }
  ];

};