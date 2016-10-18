namespace :init do 

	task :all => [:time_data, :comment_category, :demand_category, :medication_time]

	task time_data: :environment do
		TimeZone.create(zone: "0000")
		TimeZone.create(zone: "0030")
		TimeZone.create(zone: "0100")
		TimeZone.create(zone: "0130")
		TimeZone.create(zone: "0200")
		TimeZone.create(zone: "0230")
		TimeZone.create(zone: "0300")
		TimeZone.create(zone: "0330")
		TimeZone.create(zone: "0400")
		TimeZone.create(zone: "0430")
		TimeZone.create(zone: "0500")
		TimeZone.create(zone: "0530")
		TimeZone.create(zone: "0600")
		TimeZone.create(zone: "0630")
		TimeZone.create(zone: "0700")
		TimeZone.create(zone: "0730")
		TimeZone.create(zone: "0800")
		TimeZone.create(zone: "0830")
		TimeZone.create(zone: "0900")
		TimeZone.create(zone: "0930")
		TimeZone.create(zone: "1000")
		TimeZone.create(zone: "1030")
		TimeZone.create(zone: "1100")
		TimeZone.create(zone: "1130")
		TimeZone.create(zone: "1200")
		TimeZone.create(zone: "1230")
		TimeZone.create(zone: "1300")
		TimeZone.create(zone: "1330")
		TimeZone.create(zone: "1400")
		TimeZone.create(zone: "1430")
		TimeZone.create(zone: "1500")
		TimeZone.create(zone: "1530")
		TimeZone.create(zone: "1600")
		TimeZone.create(zone: "1630")
		TimeZone.create(zone: "1700")
		TimeZone.create(zone: "1730")
		TimeZone.create(zone: "1800")
		TimeZone.create(zone: "1830")
		TimeZone.create(zone: "1900")
		TimeZone.create(zone: "1930")
		TimeZone.create(zone: "2000")
		TimeZone.create(zone: "2030")
		TimeZone.create(zone: "2100")
		TimeZone.create(zone: "2130")
		TimeZone.create(zone: "2200")
		TimeZone.create(zone: "2230")
		TimeZone.create(zone: "2300")
		TimeZone.create(zone: "2330")
	end

	task comment_category: :environment do
		CommentCategory.create(name: "臨時新增")
		CommentCategory.create(name: "醫療建議")
		CommentCategory.create(name: "注意事項")
		CommentCategory.create(name: "感謝的話")
	end

	task demand_category: :environment do
		d1 = DemandCategory.create(name: "關懷服務")
			d1.demands.create(demand_name: "陪伴")
			d1.demands.create(demand_name: "情緒支持")
		d2 = DemandCategory.create(name: "個人健康照顧")
			d2.demands.create(demand_name: "盥洗")
			d2.demands.create(demand_name: "入浴")
			d2.demands.create(demand_name: "如廁")
			d2.demands.create(demand_name: "更衣")
			d2.demands.create(demand_name: "餵食")
			d2.demands.create(demand_name: "餵藥")
			d2.demands.create(demand_name: "肢體關節運動")
			d2.demands.create(demand_name: "翻身")
			d2.demands.create(demand_name: "拍背")
		d3 = DemandCategory.create(name: "家務服務")
			d3.demands.create(demand_name: "洗衣")
			d3.demands.create(demand_name: "服務對象起居環境清潔")
			d3.demands.create(demand_name: "陪同或代理購物")
			d3.demands.create(demand_name: "備餐(購買)")
			d3.demands.create(demand_name: "備餐(煮食)")
		d4 = DemandCategory.create(name: "文書服務")
			d4.demands.create(demand_name: "協助申請社會福利服務")
			d4.demands.create(demand_name: "代寫書信及聯絡親友")
		d5 = DemandCategory.create(name: "醫務服務")
			d5.demands.create(demand_name: "陪同就醫")
			d5.demands.create(demand_name: "代領藥品")
			d5.demands.create(demand_name: "量血壓/心跳")
			d5.demands.create(demand_name: "量血糖")
		d6 = DemandCategory.create(name: "休閒服務")
			d6.demands.create(demand_name: "陪同散步")
			d6.demands.create(demand_name: "閱讀書報")
		d7 = DemandCategory.create(name: "服藥時間")
			d7.demands.create(demand_name: "服藥：早餐飯前")
			d7.demands.create(demand_name: "服藥：早餐飯後")
			d7.demands.create(demand_name: "服藥：午餐飯前")
			d7.demands.create(demand_name: "服藥：午餐飯後")
			d7.demands.create(demand_name: "服藥：晚餐飯前")
			d7.demands.create(demand_name: "服藥：晚餐飯後")
			d7.demands.create(demand_name: "服藥：睡前")
		d8 = DemandCategory.create(name: "其他服務")
	end

	task medication_time: :environment do
		MedicationTime.create(name: "處方簽")
		MedicationTime.create(name: "服藥：早餐飯前", take_time: "0700" )
		MedicationTime.create(name: "服藥：早餐飯後", take_time: "0900" )
		MedicationTime.create(name: "服藥：午餐飯前", take_time: "1100" )
		MedicationTime.create(name: "服藥：午餐飯後", take_time: "1300" )
		MedicationTime.create(name: "服藥：晚餐飯前", take_time: "1730" )
		MedicationTime.create(name: "服藥：晚餐飯後", take_time: "1900" )
		MedicationTime.create(name: "服藥：睡前", take_time: "2200" )
	end
	
end