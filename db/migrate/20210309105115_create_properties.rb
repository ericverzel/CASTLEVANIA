class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.string :photo
      t.integer :price
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
