class InventoriesController < ApplicationController

  def index
    @inventories = Inventory.all.order(date: :desc)
    @inventory_dates = @inventories.map { |inventory| inventory.date.strftime('%m/%d/%Y') }.to_set
    ## collects and groups the different physical inventories by date
    @inventory_by_date = Hash[@inventory_dates.collect { |date| [date, @inventories.select { |i| i.date.strftime('%m/%d/%Y') == date }] }]
  end

  def new
    @inventory = Inventory.new
    @feed_types  = FeedType.all
  end

  def create
    inventories = []
    @feed_types = FeedType.all
    @feed_types.each do |feed_type|
      inventories.push(Inventory.new(inventory_params(feed_type)))
    end

    ## save each entry or delete all entries of the same date if an entry has a problem
    inventories.each do |inventory|
      if not inventory.save
        @to_delete = Inventory.where(date: inventory.date)
        @to_delete.destroy_all
        @errors = inventory.errors
      end
    end

    if @to_delete
      flash[:warning] = ""
      @errors.full_messages.each { |err| flash[:warning] += err }
      render :new
    else
      flash[:success] = "Inventory added!"
      redirect_to inventories_path
    end
  end

  def destroy
    @date = DateTime.parse(params[:id])
    @to_delete = Inventory.where('date BETWEEN ? AND ?', @date.beginning_of_day, @date.end_of_day).all
    @to_delete.destroy_all
    redirect_to inventories_path
  end

  def current_inventory
  end

  private

  def inventory_params(feed_type)
    {"variety"=>feed_type.variety, "quantity"=>params["#{feed_type.variety}"][:quantity], "date"=>params[:date], "feed_type_id"=>feed_type.id}
  end
end
