class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.integer :distance
      t.boolean :drop
      t.boolean :public
      t.string :start_location
      t.string :end_location

      t.timestamps null: false
    end
  end
end
