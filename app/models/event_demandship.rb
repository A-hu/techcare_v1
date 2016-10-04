class EventDemandship < ApplicationRecord
	belongs_to :event
	belongs_to :demand
end
