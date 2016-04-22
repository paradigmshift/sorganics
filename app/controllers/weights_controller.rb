class WeightsController < ApplicationController

  def new
    @weight = Weight.new
    @pig = Pig.find(params[:pig_id])
  end

  def create
    @weight = Weight.new(weight_params)
    @pig = Pig.find(params[:pig_id])
    @pig.weights << @weight

    if @weight.save
      flash[:success] = "Weight added to #{@pig.name}!"
      redirect_to pig_path(@pig)
    else
      render 'new'
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:date, :weight, :pig_id)
  end
end
