class IyelpsController < ApplicationController
  before_action :require_user
  
  def index
    @iyelps = current_user.businesses
  end
end