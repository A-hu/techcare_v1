class ApiV1::EventsController < ApiController

	before_action :find_date
	before_action :find_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all	
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		@event = @schedule_date.events.new( set_params )
		@event.save
	end

	def edit
	end

	def update
		
	end

	def destroy
		@event.destroy
	end

	private

	def find_date
		@schedule_date = Schedule.find(params[:schedule_id])
	end

	def find_event
		@event = @schedule_date.events.find(params[:id])
	end
end
