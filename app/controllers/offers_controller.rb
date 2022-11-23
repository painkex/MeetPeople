class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
  end

  def show
    @offer = Offer.find(params[:id])
    @bookings = @offer.bookings
    authorize @offer
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
    authorize @offer
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.save
    redirect_to offer_path(@offer)
    authorize @offer
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path(@offer), status: :see_other
    authorize @offer
  end

  private

  def offer_params
    params.require(:offer).permit(:start_date, :address, :end_date, :language, :description, :price_day, :photo)
  end
end
