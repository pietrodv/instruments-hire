class BookingsController < ApplicationController
  before_action :fetch_instrument, only: :create

  def index
    @bookings = policy_scope(Booking).order(:created_at).where(user_id: current_user.id)
  end

  def new
    @booking = Bookings.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.instrument = @instrument
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path, notice: 'Booking was successfully created.'
    else
      render 'instruments/show'
    end
  end

  private

  def fetch_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
