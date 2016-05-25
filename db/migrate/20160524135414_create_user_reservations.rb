class CreateUserReservations < ActiveRecord::Migration
  def change
    create_table :user_reservations do |t|
      t.string :startPlace
      t.string :destination
      t.integer :time
      t.references :user, index: true, foreign_key: true
      t.references :bus, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
