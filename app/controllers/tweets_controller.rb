class TweetsController < ApplicationController
  before_action :require_login

  # GET /tweets
  # GET /tweets.json
  def index
    @search = Tweet.ransack(params[:q])
    @tweets = @search.result
    @search2 = current_user.inverse_followers.ransack(params[:p])
    @users = @search2.result
    @tweet  = Tweet.new
    @user = User.find_by(name: current_user.name)
  end
  
  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user

    if @tweet.save
      redirect_to tweets_url
    else
      redirect_to tweets_url
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, {images: []}) 
    end
end
