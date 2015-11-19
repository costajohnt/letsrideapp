class AddColumnsToRideJoinings < ActiveRecord::Migration
  def change
  	add_column :ride_joinings, :user_id, :string
  	add_column :ride_joinings, :ride_id, :string
  end
end
