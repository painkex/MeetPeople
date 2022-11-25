class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
    @booking.user_id = current_user.id
    @offer = Offer.find(params[:offer_id])
  end


  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @offer = Offer.find(params[:offer_id])
    @booking.user = current_user
    @booking.offer = @offer
    if @booking.save
      # redirect_to "/offers/#{@offer.id}/bookings/#{@booking.id}"
      redirect_to offer_booking_path(@offer, @booking)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @offer
  end


  def update
    @booking = Booking.find(params[:id])
  end

  def show
    @booking = Booking.find(params[:offer_id])
    authorize @booking
  end

  def edit
  end

  def destroy
    @booking = Booking.find(params[:id])
    offer = @booking.offer
    @booking.destroy
    redirect_to offers_path(offer), status: :see_other
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment, :status, :id)
  end

end
