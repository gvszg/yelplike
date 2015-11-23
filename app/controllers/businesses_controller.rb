class BusinessesController < ApplicationController
  before_action :require_user
  
  def index
    @categories = Category.all
  end

  def show
    @business = Business.find(params[:id])
  end
end