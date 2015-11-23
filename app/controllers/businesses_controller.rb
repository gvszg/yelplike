class BusinessesController < ApplicationController
  before_action :require_user
  
  def index
    @categories = Category.all
  end

  def show
    @business = Business.find(params[:id])
    @reviews = @business.reviews
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to @business
    else
      render :new
      flash.now[:danger] = "Please complete all information!"
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :region, :country, :category_id).merge!(creator: current_user)
  end
end