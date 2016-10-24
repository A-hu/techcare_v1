class ApiV1::ItemsController < ApiController

  before_action :authenticate_user!

	def show

		if schedule = current_user.caregiver.schedules.find_by( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )
			@events = schedule.events.order(time_zone_id: :ASC)
		elsif params[:requester_id] == ""
			schedules = current_user.caregiver.schedules.where( scheduled_date: params[:care_date].to_date )
			@events = schedules.map{ |s| s.events }.flatten.sort_by(&:time_zone_id)
		else
			render json: { status: "200", message: "No data" }
		end

	end

	def create
		
		schedule = current_user.caregiver.schedules.find_by( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )
  
		if schedule.present?
			 has_fails = create_event( schedule, params[:items_data] )
			 if has_fails == []
			 	 UserMailer.notify_set( schedule.requester, params[:care_date].to_date ).deliver_now!
				 render json: { status: "200", message: "schedule updated" }, status: 200
			 else
				 render json: { status: "400", message: "Fail", scheduled_date: schedule.scheduled_date, fails: "Duplicate #{ has_fails }" }, status: 400
			 end
		else
			 schedule = current_user.caregiver.schedules.create( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )
			 if schedule.requester.medications.present?
			 		schedule.requester.medications.each do |med|
			 			med.event_create( schedule.scheduled_date.to_date ) if med.medication_time.id != 1 && med.medication_time.id != 9
			 	  end
			 end
			 create_event( schedule, params[:items_data] )
			 UserMailer.notify_set( schedule.requester, params[:care_date].to_date ).deliver_now!
			 render json: { status: "200", message: "schedule created" }, status: 200
		end

	end

	def complete

		schedule = current_user.caregiver.schedules.find_by( scheduled_date: params[:care_date].to_date, requester_id: params[:requester_id] )
		if schedule.present?
			data = JSON.parse( params[:items_data] )
			event = schedule.events.find_by_id( data["event_id"] )
			if event.present?
				 demand = event.demands.map {|d| d.id}
				 if demand.include?(21)
				 		if data["systolic_record"] && data["diastolic_record"] && data["heart_rate"]
					 		HealthRecord.create( requester_id: params[:requester_id], systolic_record: data["systolic_record"], diastolic_record: data["diastolic_record"], heart_rate: data["heart_rate"], record_day: data["complete_time"].to_date )
					 	else
					 		return render json: { status: "400", message: "You do not enter the value of systolic_record, diastolic_record or heart_rate" }, status: 400
					 	end
				 elsif demand.include?(22)
				 		if data["blood_sugar"]
					 		HealthRecord.create( requester_id: params[:requester_id], blood_sugar: data["blood_sugar"], record_day: data["complete_time"].to_date )
					 	else
					 		return render json: { status: "400", message: "You do not enter the value of blood_sugar" }, status: 400
					 	end
				 end
				 		
			   event.update( complete_time: data["complete_time"] )
		  		if event.push == true
				 	  UserMailer.notify_push( event.schedule.requester.user, event, data["complete_time"].to_date ).deliver_now!  
				    render json: { status: "200", message: "已寄信通知家屬事項完成" }, status: 200
	  			else
						render json: { status: "200", message: "事項完成" }, status: 200
				  end
			else
				render json: { status: "400", message: "Event ID #{ data["event_id"] } is not on #{ schedule.scheduled_date }" }, status: 400
			end
		else
			render json: { status: "400", message: "Mr/Mrs. #{ Requester.find_by_id( params[:requester_id] ).user.last_name } is not scheduled on #{ params[:care_date].to_date }" }, status: 400
		end
		
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
				 event = schedule.events.create( push: item["important"], time_zone_id: t.id, caregiver_confirm: true )
				 event.demands << Demand.find_by_id( item["item_id"] )
			end
		end
		has_fails 
	end

end
