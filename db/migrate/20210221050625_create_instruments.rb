class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :slug
      t.string :instrument_notes

      t.timestamps
    end
  end
end
