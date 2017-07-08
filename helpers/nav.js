//This is just so we dont have nav items in every route file
module.exports = function (req, items) {
  let defaults = [
    {
      title: req.t("events"),
      url: "/events"
    },
    {
      title: req.t("members"),
      url: "/members"
    },
    {
      title: req.t("sponsors"),
      url: "/sponsors"
    },
    {
      title: req.t("locations"),
      url: "/locations"
    },
    {
      title: req.t("registration"),
      url: "/registration"
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