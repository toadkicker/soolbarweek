module ApplicationHelper
  def user_is_admin?
    user_signed_in? && current_user.is_admin?
  end

  def authenticate_admin!
    unless user_is_admin?
      redirect_back(fallback_location: root_path)
    end
  end

  def cart_button(*args)
    opts = args.first
    content_tag :button, t('add_to_order'), class: 'btn btn-outline-primary', id: opts[:id]
  end

end
