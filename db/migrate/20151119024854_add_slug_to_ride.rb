class AddSlugToRide < ActiveRecord::Migration
  def change
    add_column :rides, :slug, :string
    add_index :rides, :slug, unique: true
  end
end
