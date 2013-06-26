class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)

  	if @user.save
  		redirect_to '/', notice: "Your are registered."
  	else #validation failure
  		@user.errors.delete(:password_digest)
      render :new
  	end
	end
	
	private

	def user_params
		params.require(:user).permit(:username, :password)
	end

end