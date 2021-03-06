class AddCategoryAndAvailabilityToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_reference :instruments, :category, foreign_key: true
    add_column :instruments, :availability, :boolean, default: true
  end
end
