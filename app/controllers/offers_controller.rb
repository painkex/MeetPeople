class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    authorize @offer
    @offer = Offer.find(params[:id])
    @bookings = @offer.bookings
  end

  def edit
    authorize @offer
    @offer = Offer.find(params[:id])
  end

  def update
    authorize @offer
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def new
    authorize @offer
    @offer = Offer.new
  end

  def create
    authorize @offer
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.save
    redirect_to offer_path(@offer)
  end

  def destroy
    authorize @offer
    
  end

  private

  def offer_params
    params.require(:offer).permit(:start_date, :address, :end_date, :language, :description, :price_day)
  end
end
