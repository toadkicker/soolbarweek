let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  eventsHelper = require('../helpers/events'),
  profilesHelper = require('../helpers/profiles'),
  i18n = require('i18n'),
  moment = require('moment');

exports.index = function (req, res, config) {

  res.render('events', {
    nav: nav(req),
    footer: footer(req),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    event_form_url: config.api_url + "/orders",
    events: [
      {
        title: moment(1505001600).format("dddd Do"),
        id: "ten",
        subtitle: req.t('opening_ceremony'),
        classes: [
          {
            start_time: moment('2017-09-10 21:00:00').format('HH:MM'),
            end_time: moment('2017-09-11 02:00:00').format('HH:MM'),
            location: 'B28',
            title: req.t('sunday.1.title'),
            sub_description: req.t('sunday.1.subtitle'),
            description: req.t('sunday.1.description'),
            id: 1
          },
        ]
      },
      {
        title: moment(1505088000).format("dddd Do"),
        id: "eleven",
        subtitle: req.t('masterclass'),
        classes: [
          {
            start_time: moment('2017-09-11 14:00').format('HH:MM'),
            end_time: moment('2017-09-11 17:00').format('HH:MM'),
            location: 'B28',
            title: req.t('monday.2.title'),
            sub_description: req.t('monday.2.subtitle'),
            description: req.t('monday.2.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 2
          },
          {
            start_time: moment('2017-09-11 15:00').format('HH:MM'),
            end_time: moment('2017-09-11 17:00').format('HH:MM'),
            location: 'Nomad',
            title: req.t('monday.3.title'),
            sub_description: req.t('monday.3.subtitle'),
            description: req.t('monday.3.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 3
          }
        ],
        guest_shifts: [
          {
            start_time: moment('2017-09-11 21:00').format('HH:MM'),
            end_time: moment('2017-09-12 01:00').format('HH:MM'),
            location: "Chapter One",
            profile: profilesHelper(req)[7]
          },
          {
            start_time: moment('2017-09-11 21:00').format('HH:MM'),
            end_time: moment('2017-09-12 01:00').format('HH:MM'),
            location: "B28",
            profile: profilesHelper(req)[2]
          },
          {
            start_time: moment('2017-09-11 21:00').format('HH:MM'),
            end_time: moment('2017-09-12 01:00').format('HH:MM'),
            location: "Flower Shop",
            profile: profilesHelper(req)[9]
          },
          {
            start_time: moment('2017-09-11 21:00').format('HH:MM'),
            end_time: moment('2017-09-12 01:00').format('HH:MM'),
            location: "B28",
            profile: req.t('nightcap')
          }
        ]
      },
      {
        title: moment(1505174400).format("dddd Do"),
        subtitle: req.t('masterclass'),
        id: "twelve",
        classes: [
          {
            start_time: moment('2017-09-12 14:00').format('HH:MM'),
            end_time: moment('2017-09-12 15:30').format('HH:MM'),
            location: 'The Sool Gallery',
            title: req.t('tuesday.4.title'),
            sub_description: req.t('tuesday.4.subtitle'),
            description: req.t('tuesday.4.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 4
          },
          {
            start_time: moment('2017-09-12 14:00').format('HH:MM'),
            end_time: moment('2017-09-12 17:00').format('HH:MM'),
            location: 'Gatsby',
            title: req.t('tuesday.5.title'),
            sub_description: req.t('tuesday.5.subtitle'),
            description: req.t('tuesday.5.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 5
          },
          {
            start_time: moment('2017-09-12 13:30').format('HH:MM'),
            end_time: moment('2017-09-12 15:30').format('HH:MM'),
            location: 'Vatos',
            title: req.t('tuesday.6.title'),
            sub_description: req.t('tuesday.6.subtitle'),
            description: req.t('tuesday.6.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 6
          },
          {
            start_time: moment('2017-09-12 16:60:00').format('HH:MM'),
            end_time: moment('2017-09-12 18:00').format('HH:MM'),
            location: 'Nomad',
            title: req.t('tuesday.7.title'),
            sub_description: req.t('tuesday.7.subtitle'),
            description: req.t('tuesday.7.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 7
          },
          {
            start_time: moment('2017-09-12 16:60:00').format('HH:MM'),
            end_time: moment('2017-09-12 18:00').format('HH:MM'),
            location: 'no name Bar',
            title: req.t('tuesday.8.title'),
            sub_description: req.t('tuesday.8.subtitle'),
            description: req.t('tuesday.8.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 8
          },
          {
            start_time: moment('2017-09-12 16:60:00').format('HH:MM'),
            end_time: moment('2017-09-12 18:00').format('HH:MM'),
            location: 'no name Bar',
            title: req.t('tuesday.9.title'),
            sub_description: req.t('tuesday.9.subtitle'),
            description: req.t('tuesday.9.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 9
          }
        ],
        guest_shifts: [
          {
            start_time: moment('2017-09-11 21:00').format('HH:MM'),
            end_time: moment('2017-09-12 01:00').format('HH:MM'),
            location: "no name Bar",
            profile: profilesHelper(req)[9]
          },
          {
            start_time: moment('2017-09-11 21:00').format('HH:MM'),
            end_time: moment('2017-09-12 01:00').format('HH:MM'),
            location: "B28",
            profile: profilesHelper(req)[10]
          },
          {
            start_time: moment('2017-09-11 21:00').format('HH:MM'),
            end_time: moment('2017-09-12 01:00').format('HH:MM'),
            location: "Chapter One",
            profile: profilesHelper(req)[4]
          },
          {
            start_time: moment('2017-09-11 21:00').format('HH:MM'),
            end_time: moment('2017-09-12 01:00').format('HH:MM'),
            location: "Gatsby",
            profile: profilesHelper(req)[2]
          },
          {
            start_time: moment('2017-09-11 21:00').format('HH:MM'),
            end_time: moment('2017-09-12 01:00').format('HH:MM'),
            location: "Bar in House",
            profile: req.t('nightcap')
          },
        ]
      },
      {
        title: moment(1505260800).format("dddd Do"),
        id: "thirteen",
        subtitle: req.t('masterclass'),
        classes: [
          {
            start_time: moment('2017-09-13 15:00').format('HH:MM'),
            end_time: moment('2017-09-13 17:00').format('HH:MM'),
            location: 'Volstead',
            title: req.t('wednesday.10.title'),
            sub_description: req.t('wednesday.10.subtitle'),
            description: req.t('wednesday.10.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 10
          },
          {
            start_time: moment('2017-09-13 13:00').format('HH:MM'),
            end_time: moment('2017-09-13 17:00').format('HH:MM'),
            location: 'Vatos',
            title: req.t('wednesday.11.title'),
            sub_description: req.t('wednesday.11.subtitle'),
            description: req.t('wednesday.11.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 11
          },
          {
            start_time: moment('2017-09-13 14:00').format('HH:MM'),
            end_time: moment('2017-09-13 16:00').format('HH:MM'),
            location: 'The Sool Gallery',
            title: req.t('wednesday.12.title'),
            sub_description: req.t('wednesday.12.subtitle'),
            description: req.t('wednesday.12.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 12
          },
          {
            start_time: moment('2017-09-13 14:00').format('HH:MM'),
            end_time: moment('2017-09-13 16:00').format('HH:MM'),
            location: 'Gatsby',
            title: req.t('wednesday.13.title'),
            sub_description: req.t('wednesday.13.subtitle'),
            description: req.t('wednesday.13.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 13
          },
          {
            start_time: moment('2017-09-13 14:00').format('HH:MM'),
            end_time: moment('2017-09-13 17:00').format('HH:MM'),
            location: 'Flower Shop',
            title: req.t('wednesday.14.title'),
            sub_description: req.t('wednesday.14.subtitle'),
            description: req.t('wednesday.14.description'),
            submit_button: req.t('buy_tickets'),
            price: '9,000',
            id: 14
          }
        ],
        guest_shifts: [
          {
            start_time: moment('2017-09-13 21:00').format('HH:MM'),
            end_time: moment('2017-09-14 01:00').format('HH:MM'),
            location: "Flower Shop",
            profile: profilesHelper(req)[9]
          },
          {
            start_time: moment('2017-09-13 21:00').format('HH:MM'),
            end_time: moment('2017-09-14 01:00').format('HH:MM'),
            location: "Backroom",
            profile: profilesHelper(req)[15]
          },
          {
            start_time: moment('2017-09-13 18:00').format('HH:MM'),
            end_time: moment('2017-09-13 22:00').format('HH:MM'),
            location: "Vatos space",
            profile: profilesHelper(req)[12]
          },
          {
            start_time: moment('2017-09-13 18:00').format('HH:MM'),
            end_time: moment('2017-09-13 22:00').format('HH:MM'),
            location: "Vatos space",
            profile: profilesHelper(req)[13]
          },
          {
            start_time: moment('2017-09-13 21:00').format('HH:MM'),
            end_time: moment('2017-09-13 01:00').format('HH:MM'),
            location: "Vatos space",
            profile: profilesHelper(req)[14]
          },
          {
            start_time: moment('2017-09-13 21:00').format('HH:MM'),
            end_time: moment('2017-09-13 01:00').format('HH:MM'),
            location: "Backroom",
            profile: req.t('nightcap')
          }
        ]
      },
      {
        title: moment(1505347200).format("dddd Do"),
        id: "fourteen",
        classes: [],
        guest_shifts: []
      },
      {
        title: moment(1505433600).format("dddd Do"),
        id: "fifteen",
        classes: [],
        guest_shifts: []
      },
      {
        title: moment(1505520000).format("dddd Do"),
        id: "sixteen",
        classes: [],
        guest_shifts: []
      },
      {
        title: moment(1505606400).format("dddd Do"),
        id: "seventeen",
        classes: [],
        guest_shifts: []
      },
    ]
  });
};

exports.show = function (req, res, config) {

  function getEvent(id) {
    let p = eventsHelper(req);
    let filtered = p.filter(function (i) {
      return i.id.toString() === id;
    });
    return filtered[0]
  }

  res.render('event', {
    nav: nav(req),
    footer: footer(req),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    event_form_url: config.api_url + "/orders",
    event: getEvent(req.params.id)
  })

};

exports.order = function (req, res) {
  let lang = i18n.getLocale(req);
  res.render('ok');
};