class HealthRecordsController < ApplicationController
	def show
		@requester = Requester.find(params[:id])
	end
end
