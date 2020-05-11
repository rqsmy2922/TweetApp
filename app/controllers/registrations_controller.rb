class RegistrationsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params_user)
 
    if @user.save
      login(@user.email, @user.password)
      redirect_to tweets_path
    else
      render :new
    end
  end
 
  private
 
  def params_user
    params.require(:user).permit(:display_name, :name, :email, :password, :password_confirmation)
  end 
end
