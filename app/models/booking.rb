class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :club

  validates :user_id, presence: true
  validates :club_id, presence: true
  validates :day, presence: true
  validates :time_slot, presence: true, uniqueness: { scope: [:day, :club_id],
    message: " is already booked!" }
end
