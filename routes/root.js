let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  profilesHelper = require('../helpers/profiles'),
  sponsorsHelper = require('../helpers/sponsors'),
  eventsHelper = require('../helpers/events'),
  current_year = require('../helpers/current_year'),
  moment = require('moment'),
  i18n = require('i18n');

exports.index = function (req, res) {

  function random(max) {
    let min = 0;
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  function randomSponsor() {
    let sponsors = sponsorsHelper(req);
    let r = random(sponsors.length - 1);
    return sponsors[r];
  }

  function randomProfile() {
    let profiles = profilesHelper(req);
    let r = random(profiles.length - 1);
    return profiles[r];
  }

  let featured_sponsor = randomSponsor();
  let featured_profile = randomProfile();
  let next_event = eventsHelper(req)[0];

  res.render('index', {
    current_year: current_year,
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
    footer: footer(req),
    featured_sponsor: req.t('featured_sponsor'),
    sponsor_title: featured_sponsor.title,
    sponsor_url: featured_sponsor.url,
    sponsor_logo_url: featured_sponsor.logo_url,
    sponsor_logo_alt: featured_sponsor.logo_alt,
    next_event_header: req.t('next_event_header'),
    next_event_title: next_event.title,
    next_event_start_time: next_event.start_time,
    next_event_url: "/events/" + next_event.id,
    next_event_button_text: req.t('next_event_button_text'),
    profile_header: req.t('whos_who'),
    profile_description: featured_profile.description,
    profile_button_text: req.t('learn_more')
  });
};