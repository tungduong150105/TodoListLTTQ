class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title, limit: 200
      t.string :description, limit: 200
      t.boolean :completed
      t.boolean :deleted

      t.timestamps
    end
  end
end
