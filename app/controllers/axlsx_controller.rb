class AxlsxController < ApplicationController
  require "axlsx"
  def index
    task = Task.order(:completed).where(deleted: false)
    send_xls(task)
  end
  private
  def send_xls(task)
    book = Axlsx::Package.new
    workbook = book.workbook
    sheet = workbook.add_worksheet name: "ToDoList"
    sheet.add_row ["Description", "Completed"]
    task.each do |row|
      sheet.add_row [row.description, row.completed]
      sheet.add_data_validation("B2", { type: :list, formula1: "0,1" })
    end
    send_excel_file(book)
  end

  def send_excel_file(book)
    tmp_file_path = "#{Rails.root}/tmp/axlsx_#{Time.now.to_i}.xlsx"
    book.serialize tmp_file_path
    file_name = "axlsx_#{Time.now.to_i}.xlsx"
    file_content = File.read(tmp_file_path)
    send_file file_content, filename: file_name
    File.delete tmp_file_path
  end

  def create_data(task)
    [["description", task.description], ["completed", task.completed.to_s]]
  end
end