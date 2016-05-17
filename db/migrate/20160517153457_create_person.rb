class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :project_id
      t.integer :user_id
    end
  end
end
