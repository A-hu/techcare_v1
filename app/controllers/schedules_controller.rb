class SchedulesController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user.caregiver
			@target = current_user.caregiver
			@related_users = @target.requesters.uniq
		else
			@target = current_user.requester
			@related_users = @target.caregivers.uniq
		end	
			@schedules = @target.schedules.where(["scheduled_date>=?", Time.now.to_date]).where(["scheduled_date<?",Time.now + 6.days])
			@schedule_dates = @schedules.pluck(:scheduled_date).uniq
			@timezones = TimeZone.find(@schedules.includes(:events).pluck(:time_zone_id).uniq)
	end
	def show
		if current_user.caregiver
			@target	= current_user.caregiver
			if params[:related_id]
				@related_user = Requester.find(params[:related_id])
			else	
				@related_user = Requester.find(params[:id])
			end
			@schedules = @target.schedules.where(:requester => @related_user).where(["scheduled_date >=?", Time.now.to_date]).where(["scheduled_date <?",Time.now + 6.days])
		else
			@target	= current_user.requester
			if params[:related_id]
				@related_user = Caregiver.find(params[:related_id])
			else
				@related_user = Caregiver.find(params[:id])
			end	
			@schedules = @target.schedules.where(:caregiver => @related_user).where(["scheduled_date >=?", Time.now.to_date]).where(["scheduled_date <?",Time.now + 6.days])
		end
		@schedule_dates = @schedules.pluck(:scheduled_date).uniq
		@schedule_ids = @schedules.pluck(:id).uniq
		@timezones = TimeZone.find(@schedules.includes(:events).pluck(:time_zone_id).uniq)

		# no use:
		# @schedules = @requester.caregivers.where(:user => current_user).uniq.first.schedules
		# @schedules = Schedule.includes(:events).where(:requester_id => @requester_id)
		# @schedules = Schedule.where(["scheduled_date>?", Time.now]).where(["scheduled_date<?",Time.now + 7.days]).find_by_id(@requester.events.includes(:schedule).pluck(:schedule_id))
	end
	def update
		@ids = params[:ids].split
		if current_user.requester
			@ids.each do |i|
				if params[i] != nil
						Schedule.find(i).update(:requester_confirmed => params[i])
				end
			end
			redirect_to schedule_path(current_user.requester.caregivers.first)	
		else
			@ids.each do |i|
				if params[i] != nil
						Schedule.find(i).update(:caregiver_confirmed => params[i])
				end
			end
			redirect_to schedule_path(current_user)	
		end	
	end

	def recent_days
		@requester = Requester.find(params[:requester_id])
		# @caregiver = current_user.caregiver
		daysago =params[:date].to_date - 7.days
		@schedules = @requester.schedules.where(["scheduled_date<=?", params[:date].to_date]).where(["scheduled_date>?",daysago]).order("scheduled_date Asc")
		# @schedules = @caregiver.schedules.where(:requester => @requester).where(["scheduled_date<=?", params[:date].to_date]).where(["scheduled_date>?",daysago]).order("scheduled_date Asc")
		@schedule_dates = @schedules.pluck(:scheduled_date).uniq
		@timezones = TimeZone.find(@schedules.includes(:events).pluck(:time_zone_id).uniq)	
	end

end
