class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.user_id = current_user.id
    @offer = Offer.find(params[:offer_id])
  end


  def create
    @booking = Booking.new(booking_params)
    @offer = Offer.find(params[:offer_id])
    # @booking.offer = @offer
    if @booking.save
      redirect_to offer_booking_path(@offerÒ)
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
    params.require(:booking).permit(:start_date, :end_date, :comment, :status)
  end

end
