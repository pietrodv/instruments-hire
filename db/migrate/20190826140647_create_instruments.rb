class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :name
      t.text :details
      t.string :photo
      t.float :price_per_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
