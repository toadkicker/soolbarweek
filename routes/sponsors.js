let nav = require('../helpers/nav'),
  footer = require('../helpers/footer'),
  i18n = require('i18n');
exports.index = function(req, res){
  res.render('sponsors', {
    nav: nav(req),
    footer: footer(req),
    logo_alt: req.t("logo_alt"),
    title: req.t('title'),
    lang: i18n.getLocale(req),
    sign_in: req.t('sign_in'),
    register: req.t('register'),
    sponsors: [
      {
        name: 'Ancho Reyes',
        url: "#",
        logo_url: '/images/sponsors/ancho_reyes.png',
      },
      {
        name: 'Aurensan Noir',
        url: "#",
        logo_url: '/images/sponsors/aurensan_noir.png',
      },
      {
        name: 'Bols',
        url: "#",
        logo_url: '/images/sponsors/BOLS_genever_grey.png',
      },
      {
        name: 'Carpano',
        url: "#",
        logo_url: '/images/sponsors/carpano.png',
      },
      {
        name: 'Chartreuse',
        url: "#",
        logo_url: '/images/sponsors/chartreuse.png',
      },{
        name: 'Cocktail Week Hero',
        url: "#",
        logo_url: '/images/sponsors/CocktailWeekHero.jpg',
      },
      {
        name: 'Cocktail Kingdom',
        url: "#",
        logo_url: '/images/sponsors/cocktail_kingdom.png',
      },
      {
        name: 'Cocktail Please',
        url: "#",
        logo_url: '/images/sponsors/cocktail_please.png',
      },
      {
        name: 'DA Noir',
        url: "#",
        logo_url: '/images/sponsors/DA-noir.png',
      },
      {
        name: 'Deanton',
        url: "#",
        logo_url: '/images/sponsors/Deanton.jpg',
      },
      {
        name: 'Distillerie de Paris',
        url: "#",
        logo_url: '/images/sponsors/DistilleriedeParis.jpg',
      },
      {
        name: 'Elemental Cocktails',
        url: "#",
        logo_url: '/images/sponsors/elemental_cocktails.png',
      },
      {
        name: 'Haymans',
        url: "#",
        logo_url: '/images/sponsors/haymans.png',
      },
      {
        name: 'Lemarie',
        url: "#",
        logo_url: '/images/sponsors/lemaire.jpg',
      },
      {
        name: 'Patron',
        url: "#",
        logo_url: '/images/sponsors/patron.png',
      },
      {
        name: 'Sprit It',
        url: "#",
        logo_url: '/images/sponsors/spirit_it.png',
      },
      {
        name: 'Teeling Whiskey',
        url: "#",
        logo_url: '/images/sponsors/teeling_whiskey.png',
      },
      {
        name: 'Tequila Festa',
        url: "#",
        logo_url: '/images/sponsors/tequila_festa.png',
      },
      {
        name: 'Titos',
        url: "#",
        logo_url: '/images/sponsors/titos.png',
      },
      {
        name: 'Trois Rivieres',
        url: "#",
        logo_url: '/images/sponsors/trois_rivieres.jpg',
      },
      {
        name: 'Wolhyang',
        url: "#",
        logo_url: '/images/sponsors/Wolhyang-1.png',
      },


    ]
  });
};