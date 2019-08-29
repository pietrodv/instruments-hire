class AddCategoryAndAvailabilityToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :category, :string
    add_column :instruments, :availability, :boolean, default: true
  end
end
