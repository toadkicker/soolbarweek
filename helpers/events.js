/**
 * Created by toadkicker on 7/14/17.
 */
module.exports = function (req) {
  let i18n = require('i18n');
  let lang = i18n.getLocale(req),
    moment = require('moment');

  moment.locale(lang);

  return [
    {
      start_time: moment('2017-09-10 21:00:00').format('LLLL'),
      end_time: moment('2017-09-11 02:00:00').format('LLLL'),
      location: 'TBD',
      title: "Opening Ceremony",
      description: "This is a fake event we use for testing",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 1
    },
    {
      start_time: moment('2017-09-11 14:00:00').format('LLLL'),
      end_time: moment('2017-09-11 17:00:00').format('LLLL'),
      location: 'B28',
      title: "Masterclass: Tristan Stephenson",
      description: "Bar Philosophy, How to open a bar, design a bar, bar menu design, bartending techniques",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 2
    },
    {

      start_time: moment('2017-09-11 15:00:00').format('LLLL'),
      end_time: moment('2017-09-11 17:00:00').format('LLLL'),
      location: 'Nomads',
      title: "Masterclass: Chartreuse",
      description: "",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 3
    },
    {

      start_time: moment('2017-09-11 21:00:00').format('LLLL'),
      end_time: moment('2017-09-12 01:00:00').format('LLLL'),
      location: 'Chapter One',
      title: "Guest Shift: Masahiko Endo",
      description: "",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 4
    },
    {

      start_time: moment('2017-09-11 21:00:00').format('LLLL'),
      end_time: moment('2017-09-12 01:00:00').format('LLLL'),
      location: 'B28',
      title: "Guest Shift: Tristan Stephenson",
      description: "",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 5
    },
    {

      start_time: moment('2017-09-11 21:00:00').format('LLLL'),
      end_time: moment('2017-09-12 01:00:00').format('LLLL'),
      location: 'Flower Shop',
      title: "Guest Shift: Richard Fawcett",
      description: "",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 6
    },
    {

      start_time: moment('2017-09-12 14:00:00').format('LLLL'),
      end_time: moment('2017-09-12 16:00:00').format('LLLL'),
      location: 'The Sool Galery',
      title: "Masterclass: Korean Rice Wine",
      description: "",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 6
    },
    {

      start_time: moment('2017-09-12 14:00:00').format('LLLL'),
      end_time: moment('2017-09-12 17:00:00').format('LLLL'),
      location: 'Trench Town',
      title: "Rum Seminar",
      description: "Tristan Stephenson takes you on a journey through Rum.",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 7
    },
    {

      start_time: moment('2017-09-12 14:00:00').format('LLLL'),
      end_time: moment('2017-09-12 17:00:00').format('LLLL'),
      location: 'B28',
      title: "Masterclass: Ryu Fuji",
      description: "Tristan Stephenson takes you on a journey through Rum.",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 7
    },
    {

      start_time: moment('2017-09-12 16:00:00').format('LLLL'),
      end_time: moment('2017-09-12 18:00:00').format('LLLL'),
      location: 'B28',
      title: "Masterclass: Matthew Prohibition",
      description: "Tristan Stephenson takes you on a journey through Rum.",
      submit_button: "Buy Tickets",
      price: "9,099",
      id: 8
    },
  ]
};