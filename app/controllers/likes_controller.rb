class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like

    if @like.save
      flash[:notice] = "Like was saved"
      redirect_to [@bookmark.topic]
    else
      flash[:error] = "There was a problem saving your like. Please try again."
      redirect_to [@bookmark.topic]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])
    authorize @like

    if @like.destroy
      flash[:notice] = "Like was deleted."
      redirect_to [@bookmark.topic]
    else
      flash[:error] = "There was an error deleting your like."
      redirect_to [@bookmark.topic]
    end
  end
      
end
