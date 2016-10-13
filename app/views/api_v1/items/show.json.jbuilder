json.status "200"
json.message "OK"
json.items_data @events do |e|
	json.user_id e.schedule.requester.user.id
	json.requester_name e.schedule.requester.user.first_name + e.schedule.requester.user.first_name
	json.item_id e.id
	json.operation_time e.time_zone.zone
	json.name e.demands.map { |d| d.demand_name }
	json.important e.push
	json.complete_time e.complete_time
end

      # "event_id" : "18274",
      # "operation_time" : "15:00",
      # "name" : "翻身",
      # "important" : "Y"