json.status "200" 
json.message "OK"
json.requester_data @requesters do |r|
	json.requester_id r.id
	json.name r.user.last_name + r.user.first_name
	json.photo_url r.user.picture.url
	json.status_info r.condition_description
	json.isSet events_set?(current_user.caregiver, r, @date)
end