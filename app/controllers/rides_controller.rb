class RidesController < ApplicationController

	def new
		@ride = Ride.new
	end

	def create
		@ride = Ride.create(ride_params)
		if @ride.save
			redirect_to ride_path(@ride)
		end
	end

	def edit
	end

	def update
	end

	def show
		@ride = Ride.find(params[:id])
	end

	def destroy
	end

	private

	def ride_params
		params.require(:ride).permit(:title)
	end




end
