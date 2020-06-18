module ActivatesHelper
  def require_login
    unless logged_in?
      flash[:error] = "ログインしてください"
      redirect_to "/sessions/new"
    end
  end
    
  def logged_in?
    !current_user.nil?
  end
end
