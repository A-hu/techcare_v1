json.status "200" 
json.message "OK"
json.requester_data @requesters do |r|
	json.id r.user.id
	json.name r.user.last_name + r.user.first_name
	json.photo_url r.user.picture.url
end

# => 
# "requester_data": [
#     {
#       "id": "33",
#       "name": "林英俊",
#       "photo_url": "http://103.3.61.202/xxxxx"
#     },
#     {
#       "id": "44",
#       "name": "曾漂亮",
#       photo_url": "http://103.3.61.202/xxxxxxx"
#     }
#   ]