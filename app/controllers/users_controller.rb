class UsersController < ApplicationController
  before_action :require_login

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
      unless @user = current_user
        redirect_to @user
      end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to @user, notice: 'ユーザー登録に成功しました'
      else
        render :new
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params_user)
      redirect_to users_url(@user)
    else
       render :edit
    end 
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
    
    def params_user
      params.require(:user).permit(:name, :display_name, :bio)
    end
    
    def require_login
      unless logged_in?
        flash[:error] = "ログインしてください"
        redirect_to "/sessions/new"
      end
    end
end
