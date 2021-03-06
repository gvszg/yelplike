class UsersController < ApplicationController
  before_action :require_user, only: [:show]
  
  def new
    redirect_to home_path if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:warning] = "You have registered, enjoy!"
      redirect_to sign_in_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end