class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :club, foreign_key: true
      t.date :day
      t.integer :time_slot

      t.timestamps
    end
  end
end
