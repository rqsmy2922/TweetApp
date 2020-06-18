class ActivatesController < ApplicationController
  skip_before_action :require_login, raise: false
  
  def create
    @user = User.find_by_email(params[:email])
    UserMailer.activation_needed_email(@user).deliver if @user
    redirect_to(root_path, :notice => 'ユーザー認証メールを送信しました')
  end
end
