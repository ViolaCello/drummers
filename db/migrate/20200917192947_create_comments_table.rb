class CreateCommentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :blurb
      t.integer :drummer_id
      t.integer :goal_id
    end

  end
end
