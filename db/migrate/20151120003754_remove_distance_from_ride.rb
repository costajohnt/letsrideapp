class RemoveDistanceFromRide < ActiveRecord::Migration
  def change
  	remove_column :rides, :distance
  end
end
