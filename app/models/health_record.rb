class HealthRecord < ApplicationRecord

	scope :week_data, ->(date) { where( "record_day >= ?", date - 7.days) }

	belongs_to :requester
	belongs_to :caregiver, optional: true
end
