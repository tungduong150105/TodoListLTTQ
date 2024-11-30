class Task < ApplicationRecord
  def self.import(file)
    sheet = Roo::Spreadsheet.open(file.tempfile)
    headers = sheet.row(1)
    sheet.each_with_index do |row, index|
      next if index == 0
      task_data = Hash[[headers, row].transpose]
      task = Task.new(task_data)
      task.deleted = false
      task.save!
      todo = Todo.new(userId: Current.user.id, taskID: task.id)
      todo.save!
    end
  end
end
