class Demand < ApplicationRecord
	has_many :event_demandships, dependent: :destroy
	has_many :events, through: :event_demandships, dependent: :destroy

	belongs_to :demand_category
	
end
