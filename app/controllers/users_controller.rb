class UsersController < ApplicationController
	before_filter :not_banned
	before_filter :not_signed_in_user, only: [:new, :create]
	before_filter :logged_in_user, only: [:edit, :update]
	before_filter :correct_user_or_admin, only: [:edit, :update]
	before_filter :admin_user, only: :destroy

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			log_in @user
			redirect_with_flash("You have successfully registered", :success)
		else
			render 'new'
		end
	end

	def update
		if @user.update_attributes(params[:user])
			log_in @user
			redirect_with_flash("Profile successfully updated", :success, @user)
		else
			render 'edit'
		end
	end

	def destroy
	end

	private
		def correct_user_or_admin
			@user = User.find(params[:id])
			unauthorized unless current_user?(@user) || current_user.admin?
		end

		def admin_user
			unauthorized unless current_user.admin?
		end
end
