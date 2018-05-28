class AddIndexToTrips < ActiveRecord::Migration[5.2]
  def change
    add_index :trips, :start_station
    add_index :trips, :end_station
  end
end
