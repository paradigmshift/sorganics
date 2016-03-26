class BatchesController < ApplicationController

  before_action :convert_datepicker_to_date, only: [:create]

  def index
    @active_batches = Batch.all.where(active: true).order(updated_at: :desc)
    @retired_batches = Batch.all.where(active: false).order(updated_at: :desc)
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)
    @batch.active = true

    if @batch.save
      flash[:success] = "#{@batch.name} batch added!"
      redirect_to :root
    else
      render 'new'
    end
  end

  ### toggles batches between active (one or more pigs alive) and retired (all pigs deceased) states
  def toggle
    @batch = Batch.find(params[:id])
    @batch.update(:active => @batch.active? ? false : true)
    redirect_to :back
  end

  private

  def convert_datepicker_to_date
    params[:batch][:date] = DateTime.strptime(params[:batch][:date], '%m/%d/%Y')
  end

  def batch_params
    params.require(:batch).permit(:name, :date, :active)
  end

end
