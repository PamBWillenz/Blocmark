class UsersController < ApplicationController
  before_action :authenticate_user!

    def show
    @user = current_user
    # @user = User.find(params[:id])
    # if @user.id == current_user.id
      @user_bookmarks = @user.bookmarks
      @liked_bookmarks = @user.liked_bookmarks
    # else
      # redirect_to root_url, notice: 'sorry'
    # end
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated."
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
