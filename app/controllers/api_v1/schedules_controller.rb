class ApiV1::SchedulesController < ApiController

  before_action :authenticate_user!

	def index
		@schedules = Schedule.all
		render json: @schedules.to_json
	end

	def show
		if params[:query_date].present?
			 @date = params[:query_date].to_date
			 schedules = current_user.caregiver.schedules.where( scheduled_date:  @date)
			 @requesters = schedules.map{ |s| s.requester }
		else
			render json: { status: "400", message: "Fail" }, status: 400
		end
	end

end
