class WelcomesController < ApplicationController
	layout "welcome", :only=>[:index]

	def index
	end

end
