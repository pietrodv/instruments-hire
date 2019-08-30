class AddBookingsCounterToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :bookings_count, :integer, null: false, default: 0
  end
end
