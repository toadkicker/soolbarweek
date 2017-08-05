module MapHelper

  #Takes a Location hash and turns into json for the front end
  def marker_attrs(*args)
    opts = args.first
    # set some default values if nil opts
    opts[:marker_number] = 0 if opts[:marker_number].nil?
    opts[:maker_width] = "13.72" if opts[:marker_width].nil?
    opts[:marker_height] = "13.72" if opts[:marker_height].nil?
    opts[:marker_color] = "#8f1e23" if opts[:marker_color].nil?
    opts[:marker_x] = 0 if opts[:marker_x].nil?
    opts[:marker_y] = 0 if opts[:marker_y].nil?
    {
      x: opts[:marker_x],
      y: opts[:marker_y],
      transform: "rotate(45)",
      fill: opts[:marker_color],
      height: opts[:marker_height],
      width: opts[:marker_width],
      id: opts[:id],
      number: opts[:marker_number]
    }.to_json
  end

  def location_address(*args)
    opts = args.first
    content_tag :div, class: "" do
      content_tag(:small, opts[:neighborhood]) +
      tag(:br) +
      content_tag(:b, opts[:name]) +
      content_tag(:address, opts[:street_address1]) +
      content_tag(:address, opts[:street_address2])
    end
  end

end