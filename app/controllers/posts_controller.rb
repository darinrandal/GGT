class PostsController < ApplicationController
	#before_filter :not_banned
	before_filter :logged_in_user, only: [:new, :create]
	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(params[:post])
		if @post.save
			redirect_with_flash("Post successfully created", :success)
		else
			render 'new'
		end
	end
end
