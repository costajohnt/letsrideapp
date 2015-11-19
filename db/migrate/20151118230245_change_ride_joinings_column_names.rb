class ChangeRideJoiningsColumnNames < ActiveRecord::Migration
  def change
  	remove_column :ride_joinings, :user_id, :string
  	remove_column :ride_joinings, :ride_id, :string
  	add_column :ride_joinings, :ride_joiner_id, :integer
  	add_column :ride_joinings, :creator_id, :integer
  end
end
