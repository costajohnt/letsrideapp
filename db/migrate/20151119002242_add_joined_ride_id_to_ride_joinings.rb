class AddJoinedRideIdToRideJoinings < ActiveRecord::Migration
  def change
    add_column :ride_joinings, :joined_ride_id, :integer
  end
end
