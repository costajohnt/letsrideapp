class RemoveCreatorIdFromRideJoinings < ActiveRecord::Migration
  def change
    remove_column :ride_joinings, :creator_id, :integer
  end
end
