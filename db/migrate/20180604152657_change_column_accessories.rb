class ChangeColumnAccessories < ActiveRecord::Migration[5.2]
  def change
    change_column :accessories, :role, :integer, default: 0
  end
end
