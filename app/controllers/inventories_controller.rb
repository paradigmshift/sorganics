class InventoriesController < ApplicationController
  before_action :convert_datepicker_to_date, only: [:create]

  def index
    @inventories = Inventory.all.order(updated_at: :desc)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.variety = FeedType.find(@inventory.feed_type_id).variety

    if @inventory.save
      flash[:success] = "#{@inventory.variety} added to inventory!"
      redirect_to inventories_path
    else
      render :new
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update
    @inventory = Inventory.find(params[:id])

    if @inventory.update(inventory_params)
      flash[:success] = "#{@inventory.variety} updated!"
      redirect_to inventories_path
    else
      render :edit
    end
  end

  private

  def convert_datepicker_to_date
    params[:inventory][:date] = DateTime.strptime(params[:inventory][:date], '%m/%d/%Y')
  end

  def inventory_params
    params.require(:inventory).permit(:date, :quantity, :feed_type_id)
  end
end
