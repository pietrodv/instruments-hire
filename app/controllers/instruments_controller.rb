class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create]
  skip_before_action :authenticate_user!

  def index
    @instruments = Instrument.all
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = @user
    if @instrument.save
      redirect_to user_instruments_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to instrument_path(@instrument)
    else
      render :edit
    end
  end

  def destroy
    @instrument.destroy
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :photo, :price_per_day, :user)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end
end
