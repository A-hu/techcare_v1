class HealthRecord < ApplicationRecord

	scope :week_data, ->(date, day_record) { where( "record_day > ?", date - day_record.days ).where( "record_day <= ?", date ) }

	belongs_to :requester
	belongs_to :caregiver, optional: true
end
