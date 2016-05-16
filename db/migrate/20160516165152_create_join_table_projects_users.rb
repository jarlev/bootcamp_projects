class CreateJoinTableProjectsUsers < ActiveRecord::Migration
  def change
    create_join_table :projects, :users do |t|
      t.integer :project_id
      t.integer :user_id
    end
  end
end
