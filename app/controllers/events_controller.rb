class EventsController < ApplicationController
	def index
		@events = Event.all(:order => 'created_at DESC')
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		if @event.save
			redirect_with_flash("Event created successfully", :success, events_path)
		else
			render 'new'
		end
	end
end
