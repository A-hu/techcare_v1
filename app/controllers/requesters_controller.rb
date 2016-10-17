class RequestersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_requester, only: [:show, :edit, :update, :destroy]

	def index
		@requesters = Requester.page( params[:page] ).per(10)
	end

	def show
	end

	def new
		@requester = Requester.new
	end

	def create
		@requester = Requester.new ( set_params )
		@requester.user = current_user
		@requester.save
		redirect_to schedules_path
	end

	def edit
	end

	def update
		@requester.update ( set_params )
		redirect_to requesters_path
	end

	def destroy
		@requester.destroy
		redirect_to requesters_path
	end

	private

	def find_requester
		@requester = Requester.find(params[:id])
	end

	def set_params
		params.require(:requester).permit(:user_id, :address, :condition_description)
	end
end
