class ApiV1::SchedulesController < ApiController

	def index
		@schedules = Schedule.all
		render json: @schedules.to_json
	end

	def show
		if params[:query_date]
			schedule = current_user.caregiver.schedules.find_by_scheduled_date(params[:query_date])
			@requesters = schedule.events.map{|e| e.requester }.uniq
			# render json: { message: "OK" }
		else
			render json: { message: "Fail" }, status: 400
		end
	end

end
