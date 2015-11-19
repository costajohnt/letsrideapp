# == Schema Information
#
# Table name: ride_joinings
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ride_joiner_id :integer
#  creator_id     :integer
#

class RideJoining < ActiveRecord::Base
	belongs_to :ride_creator, :class_name => "User"
	belongs_to :joined_ride, :class_name => "Ride"
end

