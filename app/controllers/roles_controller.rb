class RolesController < ApplicationController
	before_action :authenticate_user!, :except=>[:welcome]
	def index	
	end

	def welcome
		
	end

end