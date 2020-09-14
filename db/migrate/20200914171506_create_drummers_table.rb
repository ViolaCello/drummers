class CreateDrummersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :drummers do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :hometown
      t.string :favorite_drummer

      t.timestamps
    end
  end
end
