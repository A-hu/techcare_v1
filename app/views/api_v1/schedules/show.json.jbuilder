json.status "200" 
json.message "OK"
json.requester_data @requesters do |r|
	json.id r.user.id
	json.name r.user.last_name + r.user.first_name
	json.photo_url r.user.picture.url
	json.status_info r.condition_description
end