class TimeEventship < ApplicationRecord
	belongs_to :time_zone
	belongs_to :evnet
end
