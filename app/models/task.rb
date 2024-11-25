class Task < ApplicationRecord
  def self.import(file)
    sheet = Roo::Excelx.new(file.tempfile)
    sheet.each_row_streaming(offset: 1) do |row|
      task = self.new(description: row[0].value, completed: row[1].value, deleted: row[2].value)
      task.save
    end
  end
end
