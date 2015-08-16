class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])
    @url = params["body-plain"]
    if @user.present?
      @topic = @user.topics.find_or_create_by(title: params[:subject])
      @bookmark = @topic.bookmarks.create(url: @url)
    end
    head 200
  end
end