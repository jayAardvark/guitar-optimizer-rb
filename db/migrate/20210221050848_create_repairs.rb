class CreateRepairs < ActiveRecord::Migration[6.1]
  def change
    create_table :repairs do |t|
      t.string :repair_description
      t.string :date
      t.belongs_to :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
