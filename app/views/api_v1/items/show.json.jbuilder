json.status "200"
json.message "OK"
json.items_data @events do |e|
	json.event_id e.id
	json.operation_time e.time_zone.zone
	json.name e.demands.map {|d| d.demand_name}
	json.important e.push
end

      # "event_id" : "18274",
      # "operation_time" : "15:00",
      # "name" : "翻身",
      # "important" : "Y"