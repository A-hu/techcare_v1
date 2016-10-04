class TimeZone < ApplicationRecord
	has_many :time_eventships, dependent: :destroy
	has_many :events, through: :time_eventships, dependent: :destroy
end
