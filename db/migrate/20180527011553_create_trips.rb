class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.text :start_date
      t.text :end_date
      t.integer :start_station
      t.integer :end_station
      t.integer :bike_id
      t.string :subscription_type
      t.integer :zip_code

      t.timestamps
    end
  end
end
