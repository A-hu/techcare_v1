class ApiV1::ItemsController < ApiController

  before_action :authenticate_user!

	def show
		if schedule = current_user.caregiver.schedules.find_by( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )
			@events = schedule.events
		elsif params[:requester_id] == ""
			schedules = current_user.caregiver.schedules.where( scheduled_date: params[:care_date].to_date )
			@events = schedules.map{ |s| s.events }.flatten
		else
			render json: { message: "Fail" }, status: 400
		end
	end

	def create
		
		schedule = current_user.caregiver.schedules.find_by( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )
  
		if schedule.present?
			 has_fails = create_event( schedule, params[:items_data] )
			 if has_fails == []
				 render json: { status: "200", message: "schedule updated" }, status: 200
			 else
				 render json: { status: "400", message: "Fail", scheduled_date: schedule.scheduled_date, fails: "Duplicate #{ has_fails }" }, status: 400
			 end
		elsif
			 schedule = current_user.caregiver.schedules.create( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )
			 has_fails = create_event( schedule, params[:items_data] )
			 render json: { status: "200", message: "schedule created" }, status: 200
		end


	end

	def complete

		schedule = current_user.caregiver.schedules.find_by( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )
		data = JSON.parse( params[:item_data] )
		event = schedule.events.find_by_id( data["item_id"] )

		event.presents ? ( render json: { status: "200", message: "OK" }, status: 200 ) : ( render json: { status: "400", message: "This event is not existing." }, status: 400 )

	end

	def update
		
	end

	def destroy
		
	end

	private

	def create_event(schedule, raw_data)
		data = JSON.parse( raw_data )
		has_fails = []
		data["items_data"].each do |item|
			t = TimeZone.find_by_zone( item["operation_time"] )
			event = schedule.events.find_by_time_zone_id(t.id)
			if event.present?
				 event.update( push: true ) if item["important"] == true
				 begin
					 event.demands << Demand.find_by_id( item["item_id"] )
				 rescue
				 	 has_fails << [ Demand.find_by_id( item["item_id"] ).demand_name, item["operation_time"] ]
				 end
			else
				 event = schedule.events.create( push: item["important"], time_zone_id: t.id )
				 event.demands << Demand.find_by_id( item["item_id"] )
			end
		end
		has_fails 
	end

end
