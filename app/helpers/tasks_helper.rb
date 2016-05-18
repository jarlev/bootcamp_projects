module TasksHelper
	def change_table_class task_list 
		'class=completed_task' if task_list.completed
	end
end
