namespace :app do 
	task fake: :environment do
		u = User.find_by first_name: "美麗"
		i = 0
		15.times {
							i += 1
							s = u.caregiver.schedules.create(scheduled_date: i.days.from_now)
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
	end
end