class ApiV1::OrdersController < ApiController

	before_action :authenticate_user!

	def index
		@orders = Order.all
	end

	def create
		@order.new( set_params )
		@order.save
	end

	def update
		@order.update( set_params )
	end

	private

	def set_params
		params.require(:order).permit()
	end
end
