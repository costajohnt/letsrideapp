class RideJoiningsController < ApplicationController
  
  def show
    @ride_joining = RideJoining.All
  end
  
  def new
  end

  def create
    p params
    # @ride = Ride.find(9)
    # @ride_joining = RideJoining.new
    # @ride_joining.ride_joiner_id = 12
    # @ride_joining.joined_ride_id = 2
    @ride_joining = RideJoining.create(join_params)
    @ride_joining.save

    p join_params
    print 'HelloOOOOOOO'
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
