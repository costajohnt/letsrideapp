class RidesController < ApplicationController

	def new
		@ride = Ride.new
    render :new
	end

	def create
		@ride = Ride.create(ride_params)
		if @ride.save
			redirect_to @ride
    else
      render :new
		end
	end

	def edit
    @ride = Ride.find(params[:id])
    render :edit
	end

	def update
    @ride = Ride.find(params[:id])
    @ride.update_attributes(ride_params)
    redirect_to @ride
	end

	def show
    @ride = Ride.find(params[:id])
    render :show
	end

	def destroy
    Ride.destroy(params[:id])
    redirect_to user_path(current_user)
	end

	private

  	def ride_params
  		params.require(:ride).permit(:title, :start_date, :end_date, :start_time, :end_time, :start_location, :end_location, :description, :distance, :drop, :public)
  	end

end
