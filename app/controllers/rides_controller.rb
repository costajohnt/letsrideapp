class RidesController < ApplicationController
	before_action :correct_user, only: :destroy
	def index
		  @rides = Ride.all
		  if params[:q]
		  	p "in if conditional"
		    @rides = Ride.search(params[:q]).order("created_at DESC")
		  else
		  	p "in else conditional"
		    @rides = Ride.all.order('created_at DESC')
		  end
	end


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

	def correct_user
		@ride = current_user.ridess.find_by(id: params[:id])
		redirect_to root_url if @ride.nil?
	end

end
