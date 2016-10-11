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
		
		schedule = current_user.caregiver.schedules.find_by( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )

		if schedule.present?
			has_fails = create_event(schedule, params[:items_data])
		else
			schedule = current_user.caregiver.schedules.create( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )
			has_fails = create_event(schedule, params[:items_data])
		end

		has_fails == [] ? (render json: { status: "200", message: "OK" }, status: 200) : (render json: { message: "Fail", fails: has_fails }, status: 400)

	end

	def update
		
	end

	def destroy
		
	end

	private

	def set_params
		params.require(:event).permit(:requester_id, :scheduled_date, :push)
	end

	def create_event(schedule, raw_data)
		has_fails = []
		data = JSON.parse( raw_data )
		data["items_data"].each do |item|
			t = TimeZone.find_by_zone(item["operation_time"])
			if schedule.events.find_by_time_zone_id(t.id).present?
				has_fails << "#{item["operation_time"]} is already booked."
			else
				schedule.events.create( push: item["important"], time_zone_id: t.id)
			end
		end
		has_fails
	end

end
