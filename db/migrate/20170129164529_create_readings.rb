class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.float :temperature
      t.float :humidity
      t.string :sensor_id, foreign_key: true

      t.timestamps
    end
  end
end
