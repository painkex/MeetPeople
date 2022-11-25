class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @my_offers = current_user.offers
    @users = []
    @my_offers.each do |offer|
      offer.bookings.each do |book|
        @users << User.find(book.user_id)
      end
    end
  end
end
