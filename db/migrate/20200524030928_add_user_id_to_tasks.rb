class AddUserIdToTasks < ActiveRecord::Migration[5.2]

  def up
      excute 'DELETE FROM tasks;'
      add_reference :tasks, :user, null: false, index: true
  end

  def down
    remove_reference :tasks, :user, index: true
  end
end
