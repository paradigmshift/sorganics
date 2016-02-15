class PigsController < ApplicationController

  before_filter :convert_datepicker_to_date, only: [:create]

  def show
    @pig = Pig.find(params[:id])
  end
  def new
    @pig = Pig.new
  end

  def create
    @pig = Pig.new(pig_params)

    if @pig.save
      redirect_to :root
    else
      render '/new'
    end
  end

  def edit
    @pig = Pig.find(params[:id])
  end

  def update
    binding.pry
    @pig = Pig.find(params[:id])

    if @pig.update(pig_params)
      redirect_to :root
    else
      render '/edit'
    end
  end

  private

  def convert_datepicker_to_date
    params[:pig][:date] = DateTime.strptime(params[:pig][:date], '%m/%d/%Y')
  end

  def pig_params
    params.require(:pig).permit(:name, :birthdate, :weight_at_beginning, :cost, :cause_of_death, :batch_id)
  end
end
