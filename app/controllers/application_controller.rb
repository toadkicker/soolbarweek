class ApplicationController < ActionController::Base
  layout "layout"
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    I18n.locale = read_lang_header || I18n.default_locale
  end

  private
  def read_lang_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{5}/).first
  end

end
