class Medication < ApplicationRecord
	belongs_to :requester
	belongs_to :medication_time
end
