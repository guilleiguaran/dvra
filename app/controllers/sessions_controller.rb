class SessionsController < ApplicationController
  def new
  end

  def create

  end

  def create
    #user = User.find_by_email(params[:email])
    #if user && user.authenticate(params[:password])
    if user = User.find_by_sql("SELECT users WHERE email = '#{params[:email]}' AND password = '#{params[:password]}'")
      cookies[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
