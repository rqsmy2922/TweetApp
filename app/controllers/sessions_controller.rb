class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    if @user = login(params[:email], params[:password])
      redirect_to tweets_path, notice: "ログインしました"
    else
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
