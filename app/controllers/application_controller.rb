class ApplicationController < ActionController::Base
  layout "layout"
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  helper_method :current_order


  def set_locale
    I18n.locale = (user_signed_in? && current_user.try(:locale)) || read_lang_header || I18n.default_locale
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
      oi = OrderItem.where(user: current_user).first
      @order = oi.nil? ? Order.new : oi.order
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
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{5}/).first unless request.env['HTTP_ACCEPT_LANGUAGE'].nil?
  end

end
