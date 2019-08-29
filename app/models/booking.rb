class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validates :start_date, presence: true, date: { after_or_equal_to: proc { Date.today }, message: "must be at least #{(Date.today).to_s}" }, on: :create
  validates :end_date, presence: true, date: { after_or_equal_to: proc { Date.today }, message: "must be at least #{(Date.today).to_s}" }, on: :create
  validates_date_of :end_date, after_or_equal_to: :start_date
  validates_date_of :start_date, before_or_equal_to: :end_date
end
