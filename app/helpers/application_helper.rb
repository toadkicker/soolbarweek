module ApplicationHelper
  def user_is_admin?
    user_signed_in? && current_user.is_admin?
  end

  def authenticate_admin!
    unless user_is_admin?
      redirect_back(fallback_location: root_path)
    end
  end
end
