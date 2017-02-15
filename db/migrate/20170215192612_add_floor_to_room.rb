class AddFloorToRoom < ActiveRecord::Migration[5.0]
  def change
    add_reference :rooms, :floor, foreign_key: true
  end
end
