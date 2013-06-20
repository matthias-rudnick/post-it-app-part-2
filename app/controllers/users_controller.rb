class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user])

  	if @user.save
  		redirect_to '/', notice: "Your are registered."
  	else #validation failure
  		@user.errors.delete(:password_digest)
      render :new
  	end
	end
	

end