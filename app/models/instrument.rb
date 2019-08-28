class Instrument < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :price_per_day, presence: true
end
