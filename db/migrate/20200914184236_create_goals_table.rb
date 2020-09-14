class CreateGoalsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :current
      t.integer :aim
      t.integer :drummer_id
      t.integer :lesson_id

    end
  end
end
