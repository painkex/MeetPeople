class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :price_day, :description, :start_date, :end_date, :language, :address, presence: true
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }
  validates :price_day, numericality: { greater_than_or_equal_to: 0 }
end
