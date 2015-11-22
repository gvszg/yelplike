class SessionsController < ApplicationController
  def new    
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:warning] = "You have logged in!"  
      redirect_to home_path
    else
      redirect_to sign_in_path
      flash[:danger] = "Invalid email or password!"
    end    
  end
end
