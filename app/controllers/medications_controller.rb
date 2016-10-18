class MedicationsController < ApplicationController
	
	before_action :find_requester

	def index
		@medication  = Medication.new
		@medications = @requester.medications.all
	end

	def create
		@medication = @requester.medications.new( set_params )
		@medication.save
		event_create( @medication )
		redirect_to requester_medications_path( @requester )
	end

	def destroy
		@medication = Medication.find( params[:id] )
		@medication.destroy
		redirect_to requester_medications_path( @requester )
	end

	private

	def find_requester
		@requester = Requester.find( params[:requester_id] )
	end

	def set_params
		params.require(:medication).permit(:requester_id, :description, :picture, :time_id)
	end

	def event_create( medication, date )
		Event.create()medication.medication_time
	end

end
