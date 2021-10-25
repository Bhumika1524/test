class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :type, null: false
      t.references :status, null: false
      t.references :fromUser, null: false
      t.references :toUser, null: false

      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :fromUser_id
    add_foreign_key :tasks, :users, column: :toUser_id
    add_foreign_key :tasks, :task_types, column: :type_id
    add_foreign_key :tasks, :task_statuses, column: :status_id
  end
end
