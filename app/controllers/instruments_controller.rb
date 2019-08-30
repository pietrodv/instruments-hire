class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  skip_after_action :verify_authorized, only: [:mine]

  def index
    @instruments = policy_scope(Instrument).order(created_at: :DESC).group_by(&:category_id)
    # @instruments = {
    #   1: [array of instruments in category_id 1],
    #   2: [array of instruments in category_id 2]
    #   ...
    # }
    @categories = Category.all.order(:name)
  end

  def mine
    @instruments = Instrument.where(user: current_user)
    render :mine
  end

  def show
    @user = @instrument.user
    @address = @user.geocoded?
    if @address
      @marker = [{ lat: @user.latitude, lng: @user.longitude }]
    end
    @booking = Booking.new
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params)
    authorize @instrument
    @instrument.user = current_user
    if @instrument.save
      redirect_to @instrument, notice: 'Instrument was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to @instrument, notice: 'Instrument was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @instrument.destroy
    redirect_to root_path, notice: 'Instrument was successfully deleted.'
  end

  def search
    @categories = Category.all.order(:name)
    @instruments = policy_scope(Instrument).global_search(params[:query]).order(created_at: :DESC).group_by(&:category_id)
    render :index
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :details, :photo, :price_per_day, :user, :category_id, :availability, :booking_id)
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end
end
