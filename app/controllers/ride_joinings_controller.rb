class RideJoiningsController < ApplicationController
  
  def show
    @ride_joining = RideJoining.All
  end
  
  def new
  end

  def create
    @ride_joining = RideJoining.create(join_params)
    @ride_joining.save
    redirect_to :back
  end

  def edit
    @ride_joining = RideJoining.find(params[:id])
  end

  def update
    if @ride_joining = RideJoining.find(params[:id])
      @ride_joining.update_attributes(join_params)
    else
      @ride_joining = RideJoining.create(join_params)
      @ride_joining.ride_joiner_id = current_user.id
      @ride_joining.joined_ride_id = @ride.id
    end
  end

  def destroy
  end

  private

    def join_params
      params.permit(:ride_joiner_id, :joined_ride_id)
    end


end
