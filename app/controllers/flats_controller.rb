class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    Flat.create(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    Flat.destroy(params[:id])

    redirect_to flats_path, notice: "Flat deleted!"
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :price_per_night, :number_of_guests, :description)
  end
end
