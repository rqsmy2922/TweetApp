class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    email    = params_user[:email]
    password = params_user[:password]
    
    if login(email, password)
      redirect_to tweets_path, notice: "ログインしました"
    else
      @user = User.new(email: email)
      flash[:alert] = "ログインに失敗しました"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, notice: "ログアウトしました"
  end
  
  private
 
  def params_user
    params.require(:user).permit(:email, :password)
  end 
end
