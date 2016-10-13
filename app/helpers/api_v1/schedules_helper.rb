module ApiV1::SchedulesHelper

	def events_set?(caregiver, requester)

		set_wday = 0
		 if Time.now.wday != set_wday
		 		i = 0
		 		until ( Time.now.to_date + i.days ).wday == set_wday
		 		 schedule = caregiver.schedules.find_by( scheduled_date: Time.now.to_date + i.days, requester_id: requester)
		 		 return false if schedule.present? == false
		 		 i += 1
		 		end
		 		true
	 	 else
		 	 	j = 1
		 		until ( Time.now.to_date + j.days ).wday == set_wday
		 		 schedule = caregiver.schedules.find_by( scheduled_date: Time.now.to_date + i.days, requester_id: requester)
		 		 return false if schedule.present? == false
		 		 j += 1
		 		end
		 		true
		 end
	end

end
