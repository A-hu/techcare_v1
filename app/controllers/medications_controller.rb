class MedicationsController < ApplicationController
	
	before_action :find_requester

	def index
		@medication  = Medication.new
		@medications = @requester.medications.all
	end

	def create
		date = Time.now.to_date
		@medication = Medication.new( set_params )
		if @medication.picture_content_type.nil?
			flash[:alert] = "未上傳圖片"
		else
			if @requester.medications.map{|m| m.medication_time}.map{|t| t.take_time}.include?(@medication.medication_time.take_time) && @medication.medication_time.take_time.present?
				flash[:alert] = "重複上傳，如有錯誤請刪除檔案後再重新上傳"
			else
				@medication.requester = @requester
				@medication.save
				event_create( @requester, @medication, date ) unless @medication.medication_time.id == 1
			end
		end
		redirect_to requester_medications_path( @requester )
	end

	def destroy
		date = Time.now.to_date
		@medication = Medication.find( params[:id] )
		@medication.destroy
		remove_demand( @requester, @medication, date )
		redirect_to requester_medications_path( @requester )
	end

	private

	def find_requester
		@requester = Requester.find( params[:requester_id] )
	end

	def set_params
		params.require(:medication).permit(:requester_id, :description, :picture, :time_id)
	end

	def event_create( requester, medication, date )

		i = 0
		while requester.schedules.find_by( scheduled_date: (date + i.days).to_date ).present?
			schedule = requester.schedules.find_by( scheduled_date: (date + i.days).to_date )
			if schedule.present?
				t = TimeZone.find_by_zone( medication.medication_time.take_time )
				event = schedule.events.find_by( time_zone_id: t.id )
				if event.present?
					event.demands << Demand.find_by(demand_name: medication.medication_time.name)
					event.time_zone = TimeZone.find_by_zone( medication.medication_time.take_time )
				else
					event = schedule.events.create unless medication.medication_time.id == 1
					event.demands << Demand.find_by(demand_name: medication.medication_time.name)
					event.time_zone = TimeZone.find_by_zone( medication.medication_time.take_time )
				end
			else
				schedule = Schedule.create( scheduled_date: (date + i.days).to_date )
				event = schedule.events.create unless medication.medication_time.id == 1
				event.demands << Demand.find_by(demand_name: medication.medication_time.name)
				event.time_zone = TimeZone.find_by_zone( medication.medication_time.take_time )
			end
			event.save
			i += 1
		end
		
	end

	def remove_demand( requester, medication, date )

		i = 0
		while requester.schedules.find_by( scheduled_date: (date + i.days).to_date ).present?
			schedule = requester.schedules.find_by( scheduled_date: (date + i.days).to_date )
			t = TimeZone.find_by_zone( medication.medication_time.take_time )
			event = schedule.events.find_by( time_zone_id: t.id )
			medication_demand = medication.medication_time.name
			demand = Demand.find_by( demand_name: medication_demand )
			medication.destroy
			event.demands.destroy(demand)
			event.destroy if event.demands == []
			i += 1
		end
	end

end
