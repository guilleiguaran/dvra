class UsersController < ApplicationController
  # POST /users
  # POST /users.json
  # POST /users.xml
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created, location: @user }
        format.xml  { render xml: @user, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml  { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def user_params
      # 2.2 This is vulnerable to parameters tampering.
      params[:user]
      #params.require(:user).permit(:email, :password_digest)
    end
end
