class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Like was saved"
      redirect_to @bookmark
    else
      flash[:error] = "There was a problem saving your like. Please try again."
      redirect_to @bookmark
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "Like was deleted."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error deleting your like."
      redirect_to @bookmark
    end
  end
      
end
