class HealthRecordsController < ApplicationController
	before_action :authenticate_user!
	
	def show
		@requester = Requester.find(params[:id])
	end
end
