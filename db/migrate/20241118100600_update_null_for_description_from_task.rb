class UpdateNullForDescriptionFromTask < ActiveRecord::Migration[7.2]
  def change
    change_column_null :tasks, :description, false
  end
end
