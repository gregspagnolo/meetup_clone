class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def create
		event = Event.new(event_params)
		event.user_id = current_user.id
		if event.save
			redirect_to '/events'
			flash[:success] = ["Event successfully created"]
		else
			flash[:errors] = event.errors.full_messages
			redirect_to :back
		end
	end

	def show
		@event = Event.find(params[:id])
		@comment = @event.comments
	end

	def update 
		event = Event.find(params[:id])
		if event.update(event_params)
			flash[:success] = ["Event successfully updated"]
			redirect_to '/events'
		else
			flash[:errors] = event.errors.full_messages
			redirect_to :back
		end
	end

	def edit 
		@event = Event.find(params[:id])
	end

	def join
		event = Event.find(params[:id])
		Plan.create(user: current_user, event: event)
		redirect_to :back
	end

	def cancel_join
		event = Event.find(params[:id])
		Plan.find_by(user: current_user, event: event).destroy
		redirect_to :back
		flash[:success] = ["You have successfully removed yourself from this plan"]
	end

	private

		def event_params
			params.require(:event).permit(:name, :date, :city, :state)
		end

end