class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.float :total_price
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
