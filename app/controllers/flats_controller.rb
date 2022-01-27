class FlatsController < ApplicationController
  before_action :set_params, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @flat.update
      redirect_to flats_path
    else
      render 'edit'
    end
  end

  def destroy
    @flat.destroy
  end

  private

  def set_params
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flats).permit(:name, :description, :price)
  end
end
