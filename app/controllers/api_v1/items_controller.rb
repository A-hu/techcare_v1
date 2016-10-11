class ApiV1::ItemsController < ApiController

  before_action :authenticate_user!

	def show
		if schedule = current_user.caregiver.schedules.find_by_scheduled_date(params[:care_date]) && requester = Requester.find(params[:requester_id])
			events = schedule.events.where(:requester_id => requester.id)
		else
			render json: { message: "Fail"}, status: 400
		end
	end

	def create
		fails = []
		data = JSON.parse( params[:items_data] )
		data["items_data"].each do |item|
			schedule = Schedule.create( scheduled_date: params[:care_date], caregiver_id: current_user.caregiver.id )
			event = schedule.events.create( requester_id: params[:requester_id], push: item["important"])
			event.time_zone = TimeZone.find_by_zone(item["operation_time"])
			unless event.save
				fails << event.demands
			end
		end

		if fails == []
			render json: { status: "200", message: "OK", }, status: 200
		else
			render json: { message: "Fail", fails: fails }, status: 400
		end
		# items_data={"items_data" : [{"item_id" : "18273","operation_time" : "09:00","important" : "Y"},{"item_id" : "18274","operation_time" : "10:00","important" : "N"}]}
	end

	def update
		
	end

	def destroy
		
	end

	private

	def set_params
		params.require(:event).permit(:requester_id, :scheduled_date, :push)
	end

end
