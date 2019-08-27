class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = policy_scope(Instrument).order(:created_at)
  end

  def show
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
    redirect_to instruments_path, notice: 'Instrument was successfully destroyed.'
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :photo, :price_per_day, :user)
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end
end
