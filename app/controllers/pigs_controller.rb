class PigsController < ApplicationController

  before_action :convert_datepicker_to_date, only: [:create]

  def show
    @pig = Pig.find(params[:id])
  end

  def new
    @pig = Pig.new
    ## preselect batch if adding a pig from the batch table view
    @pig.batch = Batch.find(params[:batch]) if params[:batch]
  end

  def create
    @pig = Pig.new(pig_params)

    if @pig.save
      flash[:success] = "#{@pig.name} added to batch #{@pig.batch.name}"
      redirect_to :root
    else
      render '/new'
    end
  end

  def edit
    @pig = Pig.find(params[:id])
  end

  def update
    @pig = Pig.find(params[:id])

    if @pig.update(pig_params)
      flash[:success] = "#{@pig.name}'s information has been updated!"
      redirect_to :root
    else
      render '/edit'
    end
  end

  private

  def convert_datepicker_to_date
    params[:pig][:birthdate] = DateTime.strptime(params[:pig][:birthdate], '%m/%d/%Y')
  end

  def pig_params
    params.require(:pig).permit(:name, :birthdate, :weight_at_beginning, :cost, :cause_of_death, :batch_id)
  end
end
