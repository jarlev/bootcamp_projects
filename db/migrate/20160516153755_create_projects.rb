class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :due_date
      t.string :repo_name

      t.timestamps null: false
    end
  end
end
