module GalleriesHelper
  def media_tag(url, content_type, *opt)
    return unless url.present? && content_type.present?
    type = content_type.split('/')[0]
    if type.match(/image/)
      return image_tag url, opt.empty? ? {} : opt.first
    elsif type.match(/video/)
      return content_tag :video do
        content_tag :source, '', src: url
      end
    end
  end
end
