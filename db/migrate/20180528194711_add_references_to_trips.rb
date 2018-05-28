class AddReferencesToTrips < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :trips, :stations, column: :start_station
    add_foreign_key :trips, :stations, column: :end_station
  end
end
