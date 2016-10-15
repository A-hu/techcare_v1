namespace :web do

	task :recreate => [ "db:reset", "init:all", :fake ]

	task fake: :environment do
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
			
		i = 0
		10.times {
							s1 = c1.schedules.create(scheduled_date: i.days.from_now, requester_id: r1.id)
								e1 = s1.events.new
								e1.demands << Demand.all.sample(2)
								e1.time_zone = TimeZone.find(10)
								e1.caregiver_confirm = true
								e1.requester_confirm = true
								e1.save

								e2 = s1.events.new
								e2.demands << Demand.all.sample(2)
								e2.time_zone = TimeZone.find(15)
								e2.caregiver_confirm = true
								e2.requester_confirm = false
								e2.save

							s2 = c1.schedules.create(scheduled_date: i.days.from_now, requester_id: r2.id)
								e3 = s2.events.new
								e3.demands << Demand.all.sample(2)
								e3.time_zone = TimeZone.find(20)
								e3.caregiver_confirm = false
								e3.requester_confirm = true
								e3.save
							i += 1
							}	
		k = 0
		30.times {
							s1 = c1.schedules.create(scheduled_date: Time.now.days_ago(k), requester_id: r1.id)
								e1 = s1.events.new
								e1.demands << Demand.all.sample(2)
								e1.time_zone = TimeZone.find(10)
								e1.caregiver_confirm = true
								e1.requester_confirm = true
								e1.save

								e2 = s1.events.new
								e2.demands << Demand.all.sample(2)
								e2.time_zone = TimeZone.find(15)
								e2.caregiver_confirm = true
								e2.requester_confirm = false
								e2.save

							s2 = c1.schedules.create(scheduled_date: Time.now.days_ago(k), requester_id: r2.id)
								e3 = s2.events.new
								e3.demands << Demand.all.sample(2)
								e3.time_zone = TimeZone.find(rand(1..48))
								e3.caregiver_confirm = true
								e3.requester_confirm = true
								e3.save
							k += 1
							}

							for j in 1..30
								h = HealthRecord.new
								h.caregiver = c1
								h.requester = r1
								h.update(systolic_record: rand(120..140), diastolic_record: rand(80..95), heart_rate: rand(65..85), record_day: Time.now.days_ago(j) )			
							end
							
							for j in 1..30
								h = HealthRecord.new
								h.caregiver = c1
								h.requester = r2
								h.update(systolic_record: rand(120..140), diastolic_record: rand(80..95), heart_rate: rand(65..85), record_day: Time.now.days_ago(j) )			
							end
							
	end
end

