class CaregiversController < ApplicationController

	before_action :find_caregiver, only: [:show, :edit, :update, :destroy]

	def index
		@caregivers = Caregiver.page( params[:page] ).per(10)
	end

	def show
	end

	def new
		@caregiver = Caregiver.new
	end

	def create
		@caregiver = Caregiver.new( set_params )
		@caregiver.user = current_user
		@caregiver.save
		redirect_to caregivers_path
	end

	def edit
	end

	def update
		@caregiver.update( set_params )
		redirect_to caregivers_path
	end

	def destroy
		@caregiver.destroy
		redirect_to caregivers_path
	end

	private

	def find_caregiver
		@caregiver = Caregiver.find(params[:id])
	end

	def set_params
		params.require(:caregiver).permit(:user_id, :introduction, :experience, :skill, :licence_number, :licence_offdate, :training)
	end
end
