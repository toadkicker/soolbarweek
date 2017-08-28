module GalleriesHelper
  def media_tag(url, content_type, *opt)
    type = content_type.split('/')[0]
    if type.match(/image/)
      return image_tag url, opt.empty? ? {} : opt.first
    elsif type.match(/video/)
      return video_tag url, opt.empty? ? {} : opt.first
    end
  end
end
