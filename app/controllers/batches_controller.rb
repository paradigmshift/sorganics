class BatchesController < ApplicationController

  def index
    @batches = Batch.all.where(active: true)
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)

    if @batch.save
      redirect_to :root
    else
      render '/new'
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:name, :date)
  end
end
