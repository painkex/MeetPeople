class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :price_day, :description, :start_date, :end_date, :language, :address, presence: true
  validates :language, inclusion: { in: %w(Ruby Front Rails) }
  validates :end_date, comparison: { greater_than: :start_date }
  # validates :price_day, numeracality: { greater_than_or_equal_to: 0 }
end
