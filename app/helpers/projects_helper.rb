module ProjectsHelper
	def change_table_class task_list
		'class=completed_task' if task_list.completed
	end

  def find_state state
    case state 
    when "unstarted"
      "Start now"
    when "started"
      "Finish task"
    when "finished"
      "Accept task"
    end  
  end 

end
