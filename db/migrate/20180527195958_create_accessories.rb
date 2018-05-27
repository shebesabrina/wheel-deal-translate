class CreateAccessories < ActiveRecord::Migration[5.2]
  def change
    create_table :accessories do |t|
      t.string :title
      t.string :thumbnail
      t.string :description
      t.integer :price
      t.integer :role

      t.timestamps
    end
  end
end
