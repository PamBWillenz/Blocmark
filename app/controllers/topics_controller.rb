class TopicsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    @bookmark = Bookmark.new
   
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Topic was updated."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\"topic was deleted."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting your topic. Please try again."
      render :show
    end
  end
end

private

def topic_params
  params.require(:topic).permit(:title)
end
