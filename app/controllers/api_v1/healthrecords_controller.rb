class ApiV1::HealthrecordsController < ApiController

	def seven_day_records
		
		@demand = Demand.find_by_id( params[:item_id] )
		params[:care_date].present? ? ( date = params[:care_date].to_date ) : ( date = Time.now )
		day_record = 7
		if @demand.id == 21
			@healthrecords = HealthRecord.all.week_data( date, day_record ).where(requester_id: params[:requester_id], blood_sugar: nil )
		elsif @demand.id == 22
			@healthrecords = HealthRecord.all.week_data( date, day_record ).where(requester_id: params[:requester_id], systolic_record: nil, diastolic_record: nil, heart_rate: nil )
		end

		unless @healthrecords.present?
			render json: { status: "400", message: "No records before #{ day_record } days on #{ date.to_date } " }, status: 400
		end
		
	end

end


 # [21, "量血壓/心跳"], [22, "量血糖"]