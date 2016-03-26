class FeedTypesController < ApplicationController

  def index
    @feed_types = FeedType.all
  end

  def new
    @feed = FeedType.new
  end

  def create
    @feed = FeedType.new(feed_params)

    if @feed.save
      flash[:success] = "#{@feed.variety} variety added to the database!"
      redirect_to feed_types_path
    else
      render '/new'
    end
  end

  def edit
    @feed = FeedType.find(params[:id])
  end

  def update
    @feed = FeedType.find(params[:id])

    if @feed.update(feed_params)
      flash[:success] = "#{@feed.variety} updated!"
      redirect_to feed_types_path
    else
      render '/edit'
    end
  end

  private

  def feed_params
    params.require(:feed_type).permit(:variety)
  end
end
