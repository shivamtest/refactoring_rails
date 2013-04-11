module TodosHelper
	
	def todo_by_list(list)
		Todo.find_all_by_list_name(list)
	end
end