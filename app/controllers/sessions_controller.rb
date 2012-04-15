class SessionsController < ApplicationController
	before_filter :not_banned
	before_filter :not_signed_in_user, only: [:new, :create]

	def new
	end

	def create
		user = User.find_by_username(params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			log_in user
			flash[:success] = "You have successfully logged in"
			redirect_back_or root_path
		else
			flash.now[:error] = "Invalid username/password combination"
			render 'new'
		end
	end

	def destroy
		log_out
		redirect_with_flash("You have successfully logged out", :success)
	end
end