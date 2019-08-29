class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  def index
    @categories = Category.all
  end

  def show
    authorize @category
    @instruments = Instrument.where(category_id: params[:id])
  end

  private

  def set_category
    @category = Category.find(params[:id])
    authorize @category
  end
end
