class CreateRideJoinings < ActiveRecord::Migration
  def change
    create_table :ride_joinings do |t|

      t.timestamps null: false
    end
  end
end
