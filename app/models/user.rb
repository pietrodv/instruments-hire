class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :instruments, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :instruments, through: :bookings
  has_many :reviews, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
