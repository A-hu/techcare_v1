namespace :web do

	task :recreate => [ "db:reset", "init:all", :fake ]

	task fake: :environment do
		u1 = User.create(first_name: "web_c", last_name: "web", cell_phone_number: "0975648324", email: "beautiful@hotmail.com", password: "123123")
			c1 = u1.create_caregiver(introduction: "I am beautiful.", experience: "beautiful tseng", skill: "beautiful")
		u2 = User.create(first_name: "web_r1", last_name: "web", cell_phone_number: "0988576848", email: "stroke@hotmail.com", password: "123123")
			r1 = u2.create_requester(address: "台北", condition_description: "中風")
		u3 = User.create(first_name: "web_r2", last_name: "web", cell_phone_number: "0935748576", email: "accompany@hotmail.com", password: "123123")
			r2 = u3.create_requester(address: "台中", condition_description: "陪伴")
		i = 0
		10.times {
							i += 1
							s = c1.schedules.create(scheduled_date: i.days.from_now)
								e1 = s.events.new
								e1.requester = r1
								e1.demands << Demand.all.sample(2)
								e1.time_zone = TimeZone.find(10)
								e1.caregiver_confirm = true
								e1.requester_confirm = true
								e1.save

								e2 = s.events.new
								e2.requester = r1
								e2.demands << Demand.all.sample(2)
								e2.time_zone = TimeZone.find(15)
								e2.caregiver_confirm = true
								e2.requester_confirm = false
								e2.save

								e3 = s.events.new
								e3.requester = r2
								e3.demands << Demand.all.sample(2)
								e3.time_zone = TimeZone.find(20)
								e3.caregiver_confirm = false
								e3.requester_confirm = true
								e3.save
							}	
							k = 0
		30.times {
							k += 1
							s = c1.schedules.create(scheduled_date: Time.now.days_ago(k))
								e1 = s.events.new
								e1.requester = r1
								e1.demands << Demand.all.sample(2)
								e1.time_zone = TimeZone.find(10)
								e1.caregiver_confirm = true
								e1.requester_confirm = true
								e1.save

								e2 = s.events.new
								e2.requester = r1
								e2.demands << Demand.all.sample(2)
								e2.time_zone = TimeZone.find(15)
								e2.caregiver_confirm = true
								e2.requester_confirm = false
								e2.save

								e3 = s.events.new
								e3.requester = r2
								e3.demands << Demand.all.sample(2)
								e3.time_zone = TimeZone.find(20)
								e3.caregiver_confirm = false
								e3.requester_confirm = true
								e3.save
							}	
								
							for j in 1..30
								h = HealthRecord.new
								h.caregiver = c1
								h.requester = r1
								h.update(systolic_record: rand(120..140), diastolic_record: rand(80..95), heart_rate: rand(65..85), record_day: Time.now - j.day)			
							end
							
							for j in 1..30
								h = HealthRecord.new
								h.caregiver = c1
								h.requester = r2
								h.update(systolic_record: rand(120..140), diastolic_record: rand(80..95), heart_rate: rand(65..85), record_day: Time.now - j.day)			
							end


	end
end

