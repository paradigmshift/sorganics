class OutgoingInventoriesController < ApplicationController

  def new
    @feed = OutgoingInventory.new
    @batch = Batch.find(params[:batch_id])
  end

  def create
    @feed = OutgoingInventory.new(feed_params)
    @feed.variety = FeedType.find(@feed.feed_type_id).variety
    @batch = Batch.find(params[:batch_id])

    if @feed.save
      flash[:notice] = "Feed added!"
      redirect_to batch_path(Batch.find(params[:batch_id]))
    else
      render 'new'
    end
  end

  def destroy
    @feed = OutgoingInventory.find(params[:id])
    @feed.destroy
    redirect_to batch_path(Batch.find(params[:batch_id]))
  end

  private
  def feed_params
    params.require(:outgoing_inventory).permit(:quantity, :date, :variety, :feed_type_id, :batch_id)
  end

end
