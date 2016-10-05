class MedicationTime < ApplicationRecord
	has_many :medications, dependent: :destroy
end
