class TweetsController < ApplicationController
  before_action :require_login

  def index
    @search = Tweet.ransack(params[:q])
    @tweets = @search.result
    @search2 = current_user.inverse_followers.ransack(params[:p])
    @users = @search2.result
    @tweet  = Tweet.new
    @user = User.find_by(name: current_user.name)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user

    if @tweet.save
      redirect_to tweets_url
    else
      redirect_to tweets_url
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:content, {images: []}) 
    end
end
