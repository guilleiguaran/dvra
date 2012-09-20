class ApplicationController < ActionController::Base
  #protect_from_forgery
  protected

  def current_user
    @current_user ||= User.find(cookies[:user_id]) if cookies[:user_id]
  end

  def authenticate_user
    if user = User.find_by_token(request.headers["X-Authentication-Token"])
      cookies[:user_id] = user.id
    else
      render status: 400
    end
  end
end
