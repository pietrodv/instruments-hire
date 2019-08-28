class BookingsController < ApplicationController
  before_action :fetch_instrument
  def create
    @booking = Booking.new(booking_params)
    @booking.instrument_id = @instrument.id
    @booking.user_id = @instrument.user.id
    @booking.save
    redirect_to @instrument
  end

  private

  def fetch_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def booking_params
    params.require(:booking).permit(:star_date, :end_date, :status)
  end
end
