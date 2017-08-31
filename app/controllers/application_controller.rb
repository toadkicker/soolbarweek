class ApplicationController < ActionController::Base
  layout "layout"
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  helper_method :current_order

  after_action :flash_to_headers

  FLASH_TYPES = [:error, :warning, :notice, :info, :success, :keep]

  def set_locale
    begin
      if params[:locale] != nil
        cookies.permanent[:locale] = params[:locale]
        current_user.update(locale: params[:locale]) if user_signed_in?
      end
      I18n.locale = (user_signed_in? && current_user.try(:locale)) || cookies[:locale] || read_lang_header || "en-us"
    rescue I18n::InvalidLocale
      I18n.locale = "en-us"
    end
  end

  def user_is_admin?
    user_signed_in? && current_user.is_admin?
  end

  def authenticate_admin!
    unless user_is_admin?
      redirect_back(fallback_location: root_path)
    end
  end

  def current_order
    if user_signed_in?
      oi = OrderItem.current_users_cart(current_user.id).in_cart
      @order = oi.empty? ? Order.new : oi.first.order
    else
      @order = Order.new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :photo, :locale])
  end

  private

  def read_lang_header
    lang_header = request.env['HTTP_ACCEPT_LANGUAGE']
    lang_header.downcase.scan(/[a-z]{2}\-[a-z]{2}/).first unless lang_header.nil?
  end

  def flash_to_headers
    return unless request.xhr?
    msg = flash_message
    #replace german umlaute encoded in utf-8 to html escaped ones
    msg = msg.gsub("ä", "&auml;").gsub("ü", "&uuml;").gsub("ö", "&ouml;").gsub("Ä", "&Auml;").gsub("Ü", "&Uuml;").gsub("Ö", "&Ouml;").gsub("ß", "&szlig;")
    response.headers['X-Message'] = msg
    response.headers["X-Message-Type"] = flash_type.to_s

    flash.discard # don't want the flash to appear when you reload page
  end

  def flash_message
    FLASH_TYPES.each do |type|
      return flash[type] unless flash[type].blank?
    end
    # if we don't return something here, the above code will return "error, warning, notice"
    return ''
  end

  def flash_type
    #:keep will instruct the js to not update or remove the shown message.
    #just write flash[:keep] = true (or any other value) in your controller code
    FLASH_TYPES.each do |type|
      return type unless flash[type].blank?
    end
    #don't return the array from above which would happen if we don't have an explicit return statement
    #returning :empty will also allow you to easily know that no flash message was transmitted
    return :empty
  end
end
