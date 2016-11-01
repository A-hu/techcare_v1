class Medication < ApplicationRecord
	
	# scope :new_medication, ->(last_time) { where( "updated_at = ?", last_time ) }

	belongs_to :requester
	belongs_to :medication_time, foreign_key: :time_id

	has_attached_file :picture, styles: { large: "800x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

	def event_create( date )
		# self.requester.schedules.where("scheduled_date >= ?", date).each do |schedule|
		# 	schedule 
		# end

		i = 0
		while self.requester.schedules.find_by( scheduled_date: (date + i.days).to_date ).present?
			schedule = self.requester.schedules.find_by( scheduled_date: (date + i.days).to_date )
			if schedule.present?
				t = TimeZone.find_by_zone( self.medication_time.take_time )
				event = schedule.events.find_by( time_zone_id: t.id )
				if event.present?
					event.demands << Demand.find_by(demand_name: self.medication_time.name)
					event.time_zone = t
				else
					event = schedule.events.create if self.medication_time.id != 1 && self.medication_time.id
					event.demands << Demand.find_by(demand_name: self.medication_time.name)
					event.time_zone = t
				end
			else
				schedule = Schedule.create( scheduled_date: (date + i.days).to_date )
				event = schedule.events.create if self.medication_time.id != 1 && self.medication_time.id
				event.demands << Demand.find_by(demand_name: self.medication_time.name)
				event.time_zone = t
			end
			event.save
			i += 1
		end
		
	end

end
