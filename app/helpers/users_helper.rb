module UsersHelper
  def render_user_display_name user
    if user.display_name.blank?
      user.name
    else
      user.display_name
    end
  end 
end
