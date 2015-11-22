class BusinessesController < ApplicationController
  def index
    @categories = Category.all
  end
end