class IncomingInventoriesController < ApplicationController

  def index
    @incoming_inventories = IncomingInventory.all
  end

  def new
    @incoming_inventory = IncomingInventory.new
  end

  def create
    @incoming_inventory = IncomingInventory.new(incoming_inventory_params)

    if @incoming_inventory.save
      flash[:success] = "Inventory added"
      redirect_to current_inventory_path
    else
      render 'new'
    end
  end

  private

  def incoming_inventory_params
    params.require(:incoming_inventory).permit(:quantity, :date, :feed_type_id, :variety)
  end

end
