class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, :only => [:activate]

  # GET /users
  # GET /users.json
  def index
    @search = User.ransack(params[:q])
    @users = @search.result
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by(name: params[:name])
    @search = User.find_by(name: params[:name]).tweets.ransack(params[:q])
    @tweets = @search.result
    @search2 = User.find_by(name: params[:name]).inverse_followers.ransack(params[:q2])
    @inverse_followers = @search2.result
    @search3 = User.find_by(name: params[:name]).followers.ransack(params[:q3])
    @followers = @search3.result
    @search4 = User.find_by(name: params[:name]).favorites.ransack(params[:q4])
    @favorites = @search4.result.order(created_at: "DESC")
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by(name: params[:name])
      unless @user = current_user
        redirect_to @user
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = current_user
    if @user.update_attributes(params_user)
      redirect_to user_path(@user.name)
    else
      render :edit
    end 
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find_by(name: params[:name])
    @user.destroy
    redirect_to root_path, notice: '退会が完了いたしました。本サービスをご利用いただき誠にありがとうございました。'
  end
  
  def unsubscribed
    @user = User.find_by(name: params[:name])
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'ユーザー認証に成功しました')
    else
      not_authenticated
    end
  end
  
  private
    def params_user
      params.require(:user).permit(:name, :display_name, :bio, :icon)
    end
    
    def require_login
      unless logged_in?
        flash[:error] = "ログインしてください"
        redirect_to "/sessions/new"
      end
    end
end
