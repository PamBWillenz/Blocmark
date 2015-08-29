class UsersController < ApplicationController
  before_action: :authenticate_user!, except: [:show]

  def show
    @user = current_user
    @user_bookmarks = @user.bookmarks
    @liked_bookmarks = @user.likes
  end
end
