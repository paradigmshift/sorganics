class WeightsController < ApplicationController

  before_filter :convert_datepicker_to_date, only: [:create]

  def new
    @weight = Weight.new
    @pig = Pig.find(params[:pig_id])
  end

  def create
    @weight = Weight.new(weight_params)
    @pig = Pig.find(params[:pig_id])
    @pig.weights << @weight

    if @weight.save
      redirect_to pig_path(@pig)
    else
      render 'new'
    end
  end

  private

  def convert_datepicker_to_date
    params[:weight][:date] = DateTime.strptime(params[:weight][:date], '%m/%d/%Y')
  end

  def weight_params
    params.require(:weight).permit(:date, :weight, :pig_id)
  end
end
