class SchedulesController < ApplicationController
	def index
		@caregiver = current_user.caregiver
		@schedules = @caregiver.schedules.where(["scheduled_date>?", Time.now]).where(["scheduled_date<?",Time.now + 7.days])
		@schedule_dates = @schedules.pluck(:scheduled_date).uniq
		@timezones = TimeZone.find(@schedules.includes(:events).pluck(:time_zone_id).uniq)
		@requesters = @caregiver.requesters.uniq
	end
	def show
		@requester = Requester.find(params[:id])
		@caregiver = current_user.caregiver
		@schedules = @caregiver.schedules.where(:requester => @requester).where(["scheduled_date>?", Time.now]).where(["scheduled_date<?",Time.now + 7.days])
		@schedule_dates = @schedules.pluck(:scheduled_date).uniq
		@timezones = TimeZone.find(@schedules.includes(:events).pluck(:time_zone_id).uniq)
		# @schedules = @requester.caregivers.where(:user => current_user).uniq.first.schedules
		# @schedules = Schedule.includes(:events).where(:requester_id => @requester_id)
		# @schedules = Schedule.where(["scheduled_date>?", Time.now]).where(["scheduled_date<?",Time.now + 7.days]).find_by_id(@requester.events.includes(:schedule).pluck(:schedule_id))
	end
	def recent_days
		@requester = Requester.find(params[:requester_id])
		@caregiver = current_user.caregiver
		daysago =params[:date].to_date - 7.days
		@schedules = @caregiver.schedules.where(:requester => @requester).where(["scheduled_date<=?", params[:date].to_date]).where(["scheduled_date>?",daysago]).order("scheduled_date Asc")
		@schedule_dates = @schedules.pluck(:scheduled_date).uniq
		@timezones = TimeZone.find(@schedules.includes(:events).pluck(:time_zone_id).uniq)	
	end
end
