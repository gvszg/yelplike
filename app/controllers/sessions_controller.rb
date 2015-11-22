class SessionsController < ApplicationController
  def new
    redirect_to home_path if current_user 
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in!"  
      redirect_to home_path
    else
      redirect_to sign_in_path
      flash[:warning] = "Invalid email or password!"
    end    
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You have logged out!"
    redirect_to root_path
  end
end
