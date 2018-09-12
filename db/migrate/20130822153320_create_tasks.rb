class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.integer :priority
      t.date :due_date
      t.boolean :completed, null: false, default: false
      t.belongs_to :list, null: false

      t.timestamps
    end
  end
end
