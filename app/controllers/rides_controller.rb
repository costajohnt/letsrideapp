class RidesController < ApplicationController

	def new
		@ride = Ride.new
	end

	def create
		@ride = Rides.create(ride_params)
		if @ride.save
			redirect_to @ride
		end
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
	end

	private

	def ride_params
		params.require(:ride).permit(:title, :start_date, :start_time, :start_location)
	end




end
