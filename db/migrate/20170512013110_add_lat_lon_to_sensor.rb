class AddLatLonToSensor < ActiveRecord::Migration[5.0]
  def change
    add_column :sensors, :lat, :float, default: 0.0
    add_column :sensors, :lon, :float, default: 0.0
  end
end
