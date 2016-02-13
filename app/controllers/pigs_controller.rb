class PigsController < ApplicationController
  def show
    @pig = Pig.find(params[:id])
  end
  def new
    @pig = Pig.new
  end

  def create
    @pig = Pig.new(pig_params)
    binding.pry

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

  def pig_params
    params.require(:pig).permit(:name, :birthdate, :weight_at_beginning, :cost, :cause_of_death, :batch_id)
  end
end
