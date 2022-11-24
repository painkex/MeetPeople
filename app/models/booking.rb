class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :comment, :start_date, :end_date, :status, presence: true
  validates :start_date, comparison: { greater_than: :end_date }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
