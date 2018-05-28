class StationsChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column(:stations, :installation_date, :string)
  end
end
