class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :users, null: false, foreign_key: true
      t.references :ducks, null: false, foreign_key: true

      t.timestamps
    end
  end
end
