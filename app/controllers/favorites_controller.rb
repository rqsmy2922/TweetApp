class FavoritesController < ApplicationController
  before_action :require_login
 
  def create
    @tweet    = Tweet.find(params[:tweet_id])
    @favorite = current_user.favorites.build(tweet: @tweet)
 
    if @favorite.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @favorite = current_user.favorites.find_by!(tweet_id: params[:tweet_id])
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end 
end 