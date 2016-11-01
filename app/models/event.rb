# TODO:

# Add time to replace time_zone_id and time_zone model 
# Add demand_category_type to replace demands, demand_category, event_demandships models
class Event < ApplicationRecord

	DEMANDS = { 1 => "A", 2 => "B" }
	# f.select :demand_category_type, Event::DEMANDS

	validates_presence_of :schedule_id

	belongs_to :schedule
	belongs_to :time_zone, optional: true

	has_many :event_demandships, dependent: :destroy
	has_many :demands, through: :event_demandships, dependent: :destroy

end
