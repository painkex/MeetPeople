class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :price_day, :description, :start_date, :end_date, :language, :address, presence: true
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }
  validates :price_day, numericality: { greater_than_or_equal_to: 0 }
end
