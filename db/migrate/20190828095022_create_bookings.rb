class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :instrument, foreign_key: true
      t.date :start_date, :interval
      t.date :end_date, :interval
      t.boolean :status, default: false


      t.timestamps
    end
  end
end
