class OffersController < ApplicationController
  def index
    @offers = Offers.all
  end

  def show
    @offers = Offer.find(params[:id])
    @bookings = @offers.bookings
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save
    redirect_to(offer_path(@offer))
  end

  def destroy
    
  end
end
