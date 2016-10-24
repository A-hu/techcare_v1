namespace :demo do

	task :recreate => [ "db:reset", "init:all", :fake ]

	task fake: :environment do
		u1 = User.create(first_name: "Jeff", last_name: "曾", cell_phone_number: "0975648324", email: "techcare.tw001@gmail.com", password: "123123", age: 30, gender: "男")
			c1 = u1.create_caregiver(introduction: "熱心、貼心及愛心", experience: "超過三年", skill: "年老照護，安寧照護")
		u2 = User.create(first_name: "招弟", last_name: "林", cell_phone_number: "09784356", email: "techcare.tw002@gmail.com", password: "123123", age: 94, gender: "女")
			r1 = u2.create_requester(address: "台北市中正區", condition_description: "高齡 行動不便 糖尿病 高血壓")
		u3 = User.create(first_name: "錦裕", last_name: "李", cell_phone_number: "0978764532", email: "redman@gmail.com", password: "123123", age: 89, gender: "男")
			r2 = u3.create_requester(address: "新北市永和區", condition_description: "高齡 糖尿病")

		i = 0
		10.times {
							s1 = c1.schedules.create(scheduled_date: i.days.from_now.to_date, requester_id: r1.id)
								e1 = s1.events.new
								e1.demands << Demand.find( [12, 13].sample )
								e1.time_zone = TimeZone.find(21)
								e1.caregiver_confirm = true
								e1.requester_confirm = true
								e1.save

								e2 = s1.events.new
								e2.demands << Demand.find(7)
								e2.time_zone = TimeZone.find(25)
								e2.caregiver_confirm = true
								e2.requester_confirm = true
								e2.save

								e3 = s1.events.new
								e3.demands << Demand.find(22)
								e3.time_zone = TimeZone.find(31)
								e3.caregiver_confirm = true
								e3.requester_confirm = true
								e3.save

								e4 = s1.events.new
								e4.demands << Demand.find( [23, 24].sample )
								e4.time_zone = TimeZone.find(33)
								e4.caregiver_confirm = true
								e4.requester_confirm = true
								e4.save

								e5 = s1.events.new
								e5.demands << Demand.find(21)
								e5.time_zone = TimeZone.find(35)
								e5.caregiver_confirm = true
								e5.requester_confirm = true
								e5.save

							s2 = c1.schedules.create(scheduled_date: i.days.from_now.to_date, requester_id: r2.id)
								e6 = s2.events.new
								e6.demands << Demand.find( [3, 4].sample )
								e6.time_zone = TimeZone.find(42)
								e6.caregiver_confirm = true
								e6.requester_confirm = true
								e6.save
							i += 1
							}

		j = 0
		40.times {
							s1 = c1.schedules.create(scheduled_date: Time.now.days_ago(j).to_date, requester_id: r1.id, requester_confirm: true)
								m1 = s1.events.new
								m1.demands << Demand.find(25)
								m1.time_zone = TimeZone.find(15)
								m1.caregiver_confirm = true
								m1.requester_confirm = true
								m1.complete_time = "done"
								m1.save

								m2 = s1.events.new
								m2.demands << Demand.find(26)
								m2.time_zone = TimeZone.find(19)
								m2.caregiver_confirm = true
								m2.requester_confirm = true
								m2.complete_time = "done"
								m2.save

								e1 = s1.events.new
								e1.demands << Demand.find( [12, 13].sample )
								e1.time_zone = TimeZone.find(21)
								e1.caregiver_confirm = true
								e1.requester_confirm = true
								e1.complete_time = "done"
								e1.save

								e2 = s1.events.new
								e2.demands << Demand.find(7)
								e2.time_zone = TimeZone.find(25)
								e2.caregiver_confirm = true
								e2.requester_confirm = true
								e2.complete_time = "done"
								e2.save

								e3 = s1.events.new
								e3.demands << Demand.find(22)
								e3.time_zone = TimeZone.find(31)
								e3.caregiver_confirm = true
								e3.requester_confirm = true
								e3.complete_time = "done"
								e3.save

								e4 = s1.events.new
								if s1.scheduled_date.wday == 2 || s1.scheduled_date.wday == 5
									 e4.demands << Demand.find(23)
								else
									 e4.demands << Demand.find(24)
								end
								e4.time_zone = TimeZone.find(33)
								e4.caregiver_confirm = true
								e4.requester_confirm = true
								e4.complete_time = "done"
								e4.save	

								e5 = s1.events.new
								e5.demands << Demand.find(21)
								e5.time_zone = TimeZone.find(35)
								e5.caregiver_confirm = true
								e5.requester_confirm = true
								e5.push = true
							  e5.complete_time = "done"
								e5.save

								m3 = s1.events.new
								m3.demands << Demand.find(29)
								m3.time_zone = TimeZone.find(36)
								m3.caregiver_confirm = true
								m3.requester_confirm = true
								m3.complete_time = "done"
								m3.save

								m4 = s1.events.new
								m4.demands << Demand.find(30)
								m4.time_zone = TimeZone.find(39)
								m4.caregiver_confirm = true
								m4.requester_confirm = true
								m4.complete_time = "done"
								m4.save

							s2 = c1.schedules.create(scheduled_date: Time.now.days_ago(j).to_date, requester_id: r2.id, requester_confirm: true)
								e6 = s2.events.new
								e6.demands << Demand.find( [3, 4].sample )
								e6.time_zone = TimeZone.find(42)
								e6.caregiver_confirm = true
								e6.requester_confirm = true
								e6.complete_time = "done"
								e6.save
							j += 1
							}
		k = 1
		35.times {
								s1 = c1.schedules.find_by(scheduled_date: Time.now.days_ago(k).to_date, requester_id: r1.id)
								h = HealthRecord.new
								h.caregiver = c1
								h.requester = r1
								if s1.events.map{|e| e.demands}.flatten.include?(Demand.find(23))
									h.update(systolic_record: rand(140..160), diastolic_record: rand(90..105), heart_rate: rand(75..95), record_day: Time.now.days_ago(k) )	
									s1.comments.create(comment_category_id: 1, user_id: u1.id, content: "整體狀況普通，血壓數值偏高")
								else
									h.update(systolic_record: rand(120..140), diastolic_record: rand(80..95), heart_rate: rand(65..85), record_day: Time.now.days_ago(k) )	
									s1.comments.create(comment_category_id: 1, user_id: u1.id, content: "整體狀況良好")		
								end	
								k += 1
							}
		l = 1
		35.times {
								s1 = c1.schedules.find_by(scheduled_date: Time.now.days_ago(l).to_date, requester_id: r1.id)
								h = HealthRecord.new
								h.caregiver = c1
								h.requester = r1
								if Time.now.days_ago(l) >= Time.now.days_ago(7)
									h.update( blood_sugar: rand(145..165),record_day: Time.now.days_ago(l) )	
									s1.comments.create(comment_category_id: 1, user_id: u1.id, content: "血糖數值偏高")
								else
									h.update( blood_sugar: rand(110..135),record_day: Time.now.days_ago(l) )	
								end
								s2 = c1.schedules.find_by(scheduled_date: Time.now.days_ago(l).to_date, requester_id: r2.id)
								h = HealthRecord.new
								h.caregiver = c1
								h.requester = r2
								if Time.now.days_ago(l) >= Time.now.days_ago(7)
									h.update( blood_sugar: rand(145..165),record_day: Time.now.days_ago(l) )	
									s2.comments.create(comment_category_id: 1, user_id: u1.id, content: "血糖數值偏高")
								else
									h.update( blood_sugar: rand(110..135),record_day: Time.now.days_ago(l) )	
								end	
								l += 1
							}
	end
end


# TimeZone [[1, "0000"], [2, "0030"], [3, "0100"], [4, "0130"], [5, "0200"], [6, "0230"], [7, "0300"], [8, "0330"], [9, "0400"], [10, "0430"], [11, "0500"], [12, "0530"], [13, "0600"], [14, "0630"], [15, "0700"], [16, "0730"], [17, "0800"], [18, "0830"], [19, "0900"], [20, "0930"], [21, "1000"], [22, "1030"], [23, "1100"], [24, "1130"], [25, "1200"], [26, "1230"], [27, "1300"], [28, "1330"], [29, "1400"], [30, "1430"], [31, "1500"], [32, "1530"], [33, "1600"], [34, "1630"], [35, "1700"], [36, "1730"], [37, "1800"], [38, "1830"], [39, "1900"], [40, "1930"], [41, "2000"], [42, "2030"], [43, "2100"], [44, "2130"], [45, "2200"], [46, "2230"], [47, "2300"], [48, "2330"]]

# Demand [[1, "陪伴"], [2, "情緒支持"], [3, "盥洗"], [4, "入浴"], [5, "如廁"], [6, "更衣"], [7, "餵食"], [8, "餵藥"], [9, "肢體關節運動"], [10, "翻身"], [11, "拍背"], [12, "洗衣"], [13, "服務對象起居環境清潔"], [14, "陪同或代理購物"], [15, "備餐(購買)"], [16, "備餐(煮食)"], [17, "協助申請社會福利服務"], [18, "代寫書信及聯絡親友"], [19, "陪同就醫"], [20, "代領藥品"], [21, "量血壓/心跳"], [22, "量血糖"], [23, "陪同散步"], [24, "閱讀書報"], [25, "服藥：早餐飯前"], [26, "服藥：早餐飯後"], [27, "服藥：午餐飯前"], [28, "服藥：午餐飯後"], [29, "服藥：晚餐飯前"], [30, "服藥：晚餐飯後"], [31, "服藥：睡前"]]

# MedicationTime [[1, "處方簽", nil], [2, "服藥：早餐飯前", "0700"], [3, "服藥：早餐飯後", "0900"], [4, "服藥：午餐飯前", "1100"], [5, "服藥：午餐飯後", "1300"], [6, "服藥：晚餐飯前", "1730"], [7, "服藥：晚餐飯後", "1900"], [8, "服藥：睡前", "2200"], [9, "其它用藥", nil]]

#CommentCategory [[1, "照護留言"], [2, "臨時新增"], [3, "醫療建議"], [4, "注意事項"], [5, "感謝的話"]]