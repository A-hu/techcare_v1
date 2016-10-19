class TimeZone < ApplicationRecord
	has_one :event

	def to_time
		arr=self.zone.split(//)
		arr.insert(2, ':').join 
	end
end
