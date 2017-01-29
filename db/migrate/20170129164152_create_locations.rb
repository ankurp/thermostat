class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
