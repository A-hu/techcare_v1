class MedicationTime < ApplicationRecord
	has_many :medications, dependent: :destroy, foreign_key: :time_id
end
