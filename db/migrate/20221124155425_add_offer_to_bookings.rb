class AddOfferToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :offer, null: false, foreign_key: true
  end
end
