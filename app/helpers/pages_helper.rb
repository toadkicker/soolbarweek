module PagesHelper

  def nav
    [
      {
        title: t("events"),
        url: events_path,
        active: current_page?(controller: '/events')
      },
      {
        title: t("profiles"),
        url: profiles_path,
        active: current_page?(controller: '/profiles')
      },
      {
        title: t("sponsors"),
        url: sponsors_path,
        active: current_page?(sponsors_path)
      },
      {
        title: t("locations"),
        url: locations_path,
        active: current_page?(locations_path)
      }
    ]
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
            url: new_message_path
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
            url: "https://instagram.com/soolbarweek"
          },
          {
            icon: 'facebook',
            url: "https://facebook.com/soolbarweek"
          }
        ],
        nav_class: 'flex-row justify-content-end',
        column_class: 'col-md-4 ml-auto text-right'
      }
    ]
  end
end
