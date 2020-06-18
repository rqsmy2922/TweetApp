class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    email    = params_user[:email]
    password = params_user[:password]
    remember_me = params_user[:remember_me]
    
    if login(email, password, remember_me)
      redirect_to tweets_path
    else
      @user = User.new(email: email)
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url
  end
  
  private
 
  def params_user
    params.require(:user).permit(:email, :password, :remember_me)
  end 
end
