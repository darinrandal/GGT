class EventsController < ApplicationController
	def index
		@events = Event.all(:order => 'created_at DESC')
	end

	def user_events
		@events = Event.where('user_id1 = :id OR user_id2 = :id', {:id => params[:id]}).order('created_at DESC')
		render 'index'
	end
end
