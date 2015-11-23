module RidesHelper
	
	def check_if_joined
			@joined_rides.each do |ride|
				user = User.find(ride.ride_joiner_id)
				if user == current_user
					return false
				end
			end
		end
	end
