class AddCompletedToTodoList < ActiveRecord::Migration
  def change
    add_column :todo_lists, :completed, :boolean
  end
end
