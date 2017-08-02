module BootstrapFlashHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def bootstrap_flash(options = {})

    flash_messages = []
    close_button = content_tag(:button, raw('&times;'), :type => 'button', :class => 'close', 'data-dismiss' => 'alert')

    flash.each do |type, message|
      default_opts = {
        show_close: true,
        type: :info,
        container_tag: :div,
        animation: 'animate'
      }
      opts = default_opts.merge(options)

      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :info if type == :notice
      type = :success if type == :success
      type = :warning if type == :alert
      type = :danger if type == :error
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        if msg.is_a? Array
          msg = [content_tag(:strong, msg.first.titleize),
                 "&nbsp;",
                 content_tag(:span, msg.second.join(','))].join(',').remove(',')
        end

        text = content_tag(opts[:container_tag],
                           (opts[:show_close] ? close_button : '') +
                             msg.html_safe, :class => "alert #{opts[:animation]} alert-#{type} #{opts[:class]}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end