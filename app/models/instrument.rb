class Instrument < ApplicationRecord
  belongs_to :user
  has_many :bookings
  belongs_to :category
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :price_per_day, presence: true
end
