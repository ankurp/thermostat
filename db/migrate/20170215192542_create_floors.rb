class CreateFloors < ActiveRecord::Migration[5.0]
  def change
    create_table :floors do |t|
      t.string :name

      t.timestamps
    end

    Floor.create!(name: "Basement")
    Floor.create!(name: "First")
    Floor.create!(name: "Second")
  end
end
