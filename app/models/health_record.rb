class HealthRecord < ApplicationRecord
	belongs_to :requester
	belongs_to :caregiver, optional: true
end
