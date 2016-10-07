class ApiV1::EventsController < ApiController

	before_action :find_date
	before_action :find_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all	
		render json: @events.to_json
	end

	def show
	end

	def create
		@event = @schedule_date.events.new( set_params )

		if @event.save
			render json: {message: "OK"}
		else
			render json: {message: "Failed!"}, status: 400
		end
	end

	def update
		if @event.update( set_params )
			render json: {message: "OK"}
		else
			render json: {message: "Failed!"}, status: 400
		end 
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
