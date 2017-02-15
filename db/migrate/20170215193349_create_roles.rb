class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    Role.create!(name: "Custodian")
  end
end
