json.status "200"
json.message "OK"
json.items_data @events do |e|
	json.requester_id e.schedule.requester.id
	json.requester_name e.schedule.requester.user.last_name + e.schedule.requester.user.first_name
	json.event_id e.id
	json.operation_time e.time_zone.zone
	json.item_id e.demands.map {|d| d.id }.join(', ').to_i
	json.name e.demands.map { |d| d.demand_name }.join(', ')
	json.important e.push
	json.complete_time e.complete_time
	if e.schedule.requester.medications.map{ |m| m.medication_time }.map{ |t| t.take_time}.include?(e.time_zone.zone)
		json.note MedicationTime.find_by( take_time: e.time_zone.zone ).medications.find_by( requester_id: e.schedule.requester.id ).picture.url
	else
		json.note nil
	end
end	