class FollowsController < ApplicationController
  before_action :require_login
 
  def create
    @user = User.find(params[:user_id])
 
    if @user.inverse_follows.create(follower: current_user)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end 
  
  def destroy
    @user = User.find(params[:user_id])
    follow = @user.inverse_follows.find_by(follower: current_user)
    follow.destroy
    redirect_back(fallback_location: root_path)
  end
end 