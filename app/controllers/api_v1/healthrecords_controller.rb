class ApiV1::HealthrecordsController < ApiController

	def seven_day_records
		
		@demand = Demand.find_by_id( params[:item_id] )
		if @demand.id == 21
			@healthrecords = HealthRecord.all.week_data(Time.now).where(requester_id: params[:requester_id], blood_sugar: nil )
		elsif @demand.id == 22
			@healthrecords = HealthRecord.all.week_data(Time.now).where(requester_id: params[:requester_id], systolic_record: nil, diastolic_record: nil, heart_rate: nil )
		end
		
	end

end


 # [21, "量血壓/心跳"], [22, "量血糖"]