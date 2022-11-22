class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :comment, :start_date, :end_date, :status, presence: true
  validates :start_date, comparison: { greater_than: :end_date }
end
