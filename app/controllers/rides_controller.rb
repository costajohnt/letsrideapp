class RidesController < ApplicationController

	def new
		@ride = Ride.new
    render :new
	end

	def create
		@ride = Ride.create(ride_params)
    @ride.user_id = current_user.id
		if @ride.save
      @ride_joining = RideJoining.new
      @ride_joining.joined_ride_id = @ride.id
			# associate Ride with user_id
			redirect_to @ride
    else
      render :new
		end
	end

	def edit
    @ride = Ride.friendly.find(params[:id])
    render :edit
	end

	def update
    @ride = Ride.friendly.find(params[:id])
    @ride.update_attributes(ride_params)
    # associate joiner with Ride
    redirect_to @ride
	end

	def show
    @ride = Ride.friendly.find(params[:id])
    render :show
	end

	def destroy
    Ride.destroy(params[:id])
    redirect_to user_path(current_user)
	end

	private

  	def ride_params
  		params.require(:ride).permit(:title, :start_date, :end_date, :start_time, :end_time, :start_location, :end_location, :description, :distance, :drop, :public, :user_id)
  	end

end
