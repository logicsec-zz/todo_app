class CreateTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :task_lists do |t|
      t.belongs_to :owner

      t.timestamps
    end
  end
end
