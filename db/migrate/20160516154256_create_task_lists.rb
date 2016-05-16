class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.string :task_name
      t.text :task_description
      t.integer :user_id
      t.integer :priority

      t.timestamps null: false
    end
  end
end
