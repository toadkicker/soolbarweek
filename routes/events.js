let nav = require('../helpers/nav'),
footer = require('../helpers/footer'),
  i18n = require('i18n'),
  moment = require('moment');
exports.index = function (req, res, config) {
  let lang = i18n.getLocale(req);
  moment.locale(lang);
  res.render('events', {
    nav: nav(req),
    footer: footer(req),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: lang,
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    event_form_url: config.api_url + "/orders",
    events: [
      {
        start_time: moment('2017-09-10 21:00:00').format('LLLL'),
        end_time: moment('2017-09-11 02:00:00').format('LLLL'),
        location: 'TBD',
        title: "Opening Ceremony",
        description: "This is a fake event we use for testing",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {
        start_time: moment('2017-09-11 14:00:00').format('LLLL'),
        end_time: moment('2017-09-11 17:00:00').format('LLLL'),
        location: 'B28',
        title: "Masterclass: Tristan Stephenson",
        description: "Bar Philosophy, How to open a bar, design a bar, bar menu design, bartending techniques",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {

        start_time: moment('2017-09-11 15:00:00').format('LLLL'),
        end_time: moment('2017-09-11 17:00:00').format('LLLL'),
        location: 'Nomads',
        title: "Masterclass: Chartreuse",
        description: "",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {

        start_time: moment('2017-09-11 21:00:00').format('LLLL'),
        end_time: moment('2017-09-12 01:00:00').format('LLLL'),
        location: 'Chapter One',
        title: "Guest Shift: Masahiko Endo",
        description: "",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {

        start_time: moment('2017-09-11 21:00:00').format('LLLL'),
        end_time: moment('2017-09-12 01:00:00').format('LLLL'),
        location: 'B28',
        title: "Guest Shift: Tristan Stephenson",
        description: "",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {

        start_time: moment('2017-09-11 21:00:00').format('LLLL'),
        end_time: moment('2017-09-12 01:00:00').format('LLLL'),
        location: 'Flower Shop',
        title: "Guest Shift: Richard Fawcett",
        description: "",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {

        start_time: moment('2017-09-12 14:00:00').format('LLLL'),
        end_time: moment('2017-09-12 16:00:00').format('LLLL'),
        location: 'The Sool Galery',
        title: "Masterclass: Korean Rice Wine",
        description: "",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {

        start_time: moment('2017-09-12 14:00:00').format('LLLL'),
        end_time: moment('2017-09-12 17:00:00').format('LLLL'),
        location: 'Trench Town',
        title: "Rum Seminar",
        description: "Tristan Stephenson takes you on a journey through Rum.",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {

        start_time: moment('2017-09-12 14:00:00').format('LLLL'),
        end_time: moment('2017-09-12 17:00:00').format('LLLL'),
        location: 'B28',
        title: "Masterclass: Ryu Fuji",
        description: "Tristan Stephenson takes you on a journey through Rum.",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
      {

        start_time: moment('2017-09-12 16:00:00').format('LLLL'),
        end_time: moment('2017-09-12 18:00:00').format('LLLL'),
        location: 'B28',
        title: "Masterclass: Matthew Prohibition",
        description: "Tristan Stephenson takes you on a journey through Rum.",
        submit_button: "Buy Tickets",
        price: "9,099"
      },
    ]
  });
};