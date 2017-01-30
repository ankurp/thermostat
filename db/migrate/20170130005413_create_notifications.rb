class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :sensor_id, foreign_key: true
      t.references :reading, foreign_key: true
      t.boolean :is_acknowledged, default: false
      t.references :notification_trigger, foreign_key: true

      t.timestamps
    end
  end
end
