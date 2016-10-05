namespace :test do
	
	task caregiver_requester_health_record: :environment do
		u1 = User.create(first_name: "美麗", last_name: "曾", cell_phone_number: "0975648324", email: "beautiful@hotmail.com", password: "123123")
			c1 = u1.create_caregiver(introduction: "I am beautiful.", experience: "beautiful tseng", skill: "beautiful")
		u2 = User.create(first_name: "英俊", last_name: "郝", cell_phone_number: "09784356", email: "handsome@gmail.com", password: "123123")
			c2 = u2.create_caregiver(introduction: "I am handsome.", experience: "handsome hao", skill: "handsome")
		u3 = User.create(first_name: "紅人", last_name: "李", cell_phone_number: "0978764532", email: "redman@gmail.com", password: "123123")
			c3 = u3.create_caregiver(introduction: "I am redman.", experience: "redman lee", skill: "redman")
		u4 = User.create(first_name: "三", last_name: "張", cell_phone_number: "0988576848", email: "stroke@hotmail.com", password: "123123")
			r1 = u4.create_requester(address: "台北", condition_description: "中風")
		u5 = User.create(first_name: "四", last_name: "李", cell_phone_number: "0935748576", email: "accompany@hotmail.com", password: "123123")
			r2 = u5.create_requester(address: "台中", condition_description: "陪伴")
		u6 = User.create(first_name: "五", last_name: "王", cell_phone_number: "0933245673", email: "elder@hotmail.com", password: "123123")
			r3 = u6.create_requester(address: "台南", condition_description: "年老")

		caregivers = Caregiver.all
		requesters = Requester.all
		for i in 0...3
			for j in 1..30
				h = HealthRecord.new
				h.caregiver = caregivers[i]
				h.requester = requesters[i]
				h.update(systolic_record: rand(120..140), diastolic_record: rand(80..95), heart_rate: rand(65..85), record_day: Time.now - j.day)			
			end
		end
	
	end

end