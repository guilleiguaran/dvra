class SessionsController < ApplicationController
  def create
    #user = User.find_by_email(params[:email])
    #if user && user.authenticate(params[:password])

    # if user = a' OR '1'='1 and password = a' OR '1'='1 the SQL becomes:
    # "SELECT * FROM users WHERE email = 'a' OR '1'='1' AND password = 'a' OR '1'='1'"
    if user = User.find_by_sql("SELECT * FROM users WHERE email = '#{params[:email]}' AND password = '#{params[:password]}'").first
      render json: { token: user.token }
    else
      render json: { error: "Invalid email or password" }
    end
  end
end
