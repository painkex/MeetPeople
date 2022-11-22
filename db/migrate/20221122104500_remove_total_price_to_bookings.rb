class RemoveTotalPriceToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :total_price
  end
end
