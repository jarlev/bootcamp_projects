class AddFieldsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :project_id, :integer
    add_column :notes, :user_id, :integer
  end
end