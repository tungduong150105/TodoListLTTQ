class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.integer :userId
      t.integer :taskID

      t.timestamps
    end
  end
end
