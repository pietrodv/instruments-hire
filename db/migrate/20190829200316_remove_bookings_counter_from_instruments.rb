class RemoveBookingsCounterFromInstruments < ActiveRecord::Migration[5.2]
  def change
    remove_column :instruments, :bookings_count, :integer
  end
end
