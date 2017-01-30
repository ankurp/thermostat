class CreateSensorTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :sensor_types do |t|
      t.string :name

      t.timestamps
    end

    SensorType.create!(name: 'temperature')
    SensorType.create!(name: 'humidity')
  end
end
