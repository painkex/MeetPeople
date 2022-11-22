class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.user_id = current_user.id
    @offer = Offer.find(params[:offer_id])
  end


  def create
    @booking = Booking.new(booking_params)
    @offer = Offer.find(params[:offer_id])
    @booking.offer = @offer
    if @booking.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    @booking = Booking.find(params[:id])
  end

  def show
  end

  def edit
  end

  def destroy
    @booking =Booking.find(params[:id])
    offer = @booking.list
    @booking.destroy
    redirect_to offers_path(offer), status: :see_other
  end

  private
  def booking_params
    params.require(:booking).permit(:comment,  :movie_id)
  end

end

