class RegistrationsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to(root_path, :notice => 'ユーザー認証用メールを送信いたしました、ご確認ください.')
    else
      render :new
    end
  end
  
  private
 
  def params_user
    params.require(:user).permit(:display_name, :name, :email, :password, :password_confirmation)
  end 
end
