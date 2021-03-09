class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.date :date_from
      t.date :date_to
      t.boolean :is_accepted

      t.timestamps
    end
  end
end
