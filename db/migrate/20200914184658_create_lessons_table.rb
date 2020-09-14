class CreateLessonsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :exercise
      t.string :description 
    end

  end
end
  