class CreateTripStations < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_stations do |t|
      t.references :station, foreign_key: true
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
