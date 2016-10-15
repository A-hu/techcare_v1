module ApiV1::SchedulesHelper

	def events_set?(caregiver, requester, from_date)
		set_wday = 0
		 if from_date.wday != set_wday
		 		i = 0
		 		until ( from_date + i.days ).wday == set_wday
		 		 schedule = caregiver.schedules.find_by( scheduled_date: ( from_date + i.days ), requester_id: requester.id)
		 		 return false unless schedule.present? 
		 		 i += 1
		 		end
	 	 else
		 	 	j = 1
		 		until ( from_date + j.days ).wday == set_wday
		 		 schedule = caregiver.schedules.find_by( scheduled_date: ( from_date + j.days ), requester_id: requester.id)
		 		 return false unless schedule.present? 
		 		 j += 1
		 		end
		 end
 		true
	end
end
