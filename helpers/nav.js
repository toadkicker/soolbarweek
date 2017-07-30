//This is just so we dont have nav items in every route file
module.exports = function (req, items) {

  function isActive(path) {
    if(req.hasOwnProperty('route') && req.route.hasOwnProperty('path')) {
      return req.route.path.startsWith(`/${path}`) ? 'active' : ''
    }
  }

  let defaults = [
    {
      title: req.t("events"),
      url: "/events",
      active: isActive('events')
    },
    {
      title: req.t("profiles"),
      url: "/profiles",
      active: isActive('profiles')
    },
    {
      title: req.t("sponsors"),
      url: "/sponsors",
      active: isActive('sponsors')
    },
    {
      title: req.t("locations"),
      url: "/locations",
      active: isActive('locations')
    },
    {
      title: req.t("registration"),
      url: "/registration",
      active: isActive('registration')
    }
  ];

  let navItem = function (opts) {
    return {
      title: req.t(opts.title),
      url: opts.url,
      active: opts.active,
      disabled: opts.disabled
    }
  };

  let navItems = [];
  for(let item in items) navItems.push(navItem(item));

  return navItems.length === 0 ? defaults : navItems
};