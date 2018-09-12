class AddNameToTaskList < ActiveRecord::Migration[5.2]
  def change
    add_column :task_lists, :name, :string
  end
end
