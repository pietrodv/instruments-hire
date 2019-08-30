class ReviewsController < ApplicationController
  before_action :set_instrument

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.instrument = @instrument
    @review.user = current_user
    if @review.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :instrument, :user, :rating)
  end

  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end
end
