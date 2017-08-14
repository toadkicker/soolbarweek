module PagesHelper
  def nav
    [
      {
        title: t('events'),
        url: events_path,
        active: current_page?(events_path)
      },
      {
        title: t('profiles'),
        url: profiles_path,
        active: current_page?(profiles_path)
      },
      {
        title: t('sponsors'),
        url: sponsors_path,
        active: current_page?(sponsors_path)
      },
      {
        title: t('locations'),
        url: locations_path,
        active: current_page?(locations_path)
      }
    ]
  end

  def admin_nav
    [{
       title: t('translations'),
       url: locale_translations_path(current_user.try(:locale)),
       active: current_page?('/translations')
     }, {
       title: t('users'),
       url: admin_users_path,
       active: current_page?(admin_users_path)
     }, {
       title: t('order_statuses'),
       url: admin_order_statuses_path,
       active: current_page?(admin_order_statuses_path)
     },
     {
       title: t('order_history'),
       url: admin_orders_path,
       active: current_page?(admin_orders_path)
     }]
  end

  def footer
    [
      {
        footer_links: nav,
        nav_class: 'flex-column',
        column_class: 'col-md-3 col-sm-6 pl-0'
      },
      {
        footer_links: [
          {
            title: t('contact_us'),
            url: contact_path
          },
          {
            title: t('about'),
            url: about_path
          },
          {
            title: t('privacy'),
            url: privacy_path
          },
          {
            title: t('tos'),
            url: terms_of_service_path
          }
        ],
        nav_class: 'flex-column',
        column_class: 'col-md-3 col-sm-6 pl-0'
      },
      {
        footer_links: [
          {
            icon: 'instagram',
            url: 'https://instagram.com/soolbarweek'
          },
          {
            icon: 'facebook',
            url: 'https://facebook.com/soolbarweek'
          },
          {
            icon: 'coffee',
            url: '/transit',
            title: t('please_drink_responsibly')
          }
        ],
        nav_class: 'flex-row justify-content-end',
        column_class: 'col-md-4 ml-auto text-right'
      }
    ]
  end
end
