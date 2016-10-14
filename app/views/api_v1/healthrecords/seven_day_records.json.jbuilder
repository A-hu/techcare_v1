json.status "200"
json.message "OK"
json.item_id @demand.id
json.item_name @demand.demand_name
json.item_histroy @healthrecords do |healthrecord|
	json.care_date healthrecord.record_day
	json.systolic_record healthrecord.systolic_record
	json.diastolic_record healthrecord.diastolic_record
	json.heart_rate healthrecord.heart_rate
	json.blood_sugar healthrecord.blood_sugar
end

