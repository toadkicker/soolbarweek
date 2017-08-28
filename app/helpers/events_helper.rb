module EventsHelper
  def event_status_tag(max_seats)
    if max_seats == -1
      return content_tag :b, t('open_seating').upcase, class: 'badge badge-info'
    end

    if max_seats >= 1
      return content_tag :b, [max_seats.to_s, t('available').upcase].join(' '), class: 'badge badge-info'
    end

    if max_seats == 0
      return content_tag :b, t('sold_out').upcase, class: 'badge badge-danger'
    end
  end

  def event_price_tag(price)
    if price == 0
      content_tag :b, t('free'), class: 'badge badge-danger'
    else
      humanized_money_with_symbol price
    end
  end
end
