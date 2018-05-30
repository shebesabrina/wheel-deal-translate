class ChangeDataTypeStations < ActiveRecord::Migration[5.2]
  def change
    change_column(:stations, :installation_date, :date)
  end
end
