class AddStateToTaskList < ActiveRecord::Migration
  def change
    add_column :task_lists, :state, :string
  end
end
