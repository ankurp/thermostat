class CreateSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :sensors, id: false do |t|
      t.string :uuid, primary: true
      t.string :name
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
