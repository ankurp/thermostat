class CreateNotificationTriggers < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_triggers do |t|
      t.float :sensor_value
      t.references :sensor_type, foreign_key: true
      t.integer :trigger_when, default: 0
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
