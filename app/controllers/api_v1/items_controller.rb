class ApiV1::ItemsController < ApiController

  before_action :authenticate_user!

	def show
		if schedule = current_user.caregiver.schedules.find_by_scheduled_date(params[:query_date]) && requester = Requester.find(params[:requester_uuid])
			@events = schedule.events.where(:requester_id => requester.id)
		else
			render json: { message: "Fail"}, status: 400
		end
	end

end
