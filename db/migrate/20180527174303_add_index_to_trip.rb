class AddIndexToTrip < ActiveRecord::Migration[5.2]
  def change
    add_index :trips, :end_date
  end
end
