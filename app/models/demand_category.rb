class DemandCategory < ApplicationRecord
	has_many :demands, dependent: :destroy
end
