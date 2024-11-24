class XmlController < ApplicationController
  def index
    @tasks = Task.order(:completed)
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv, filename: "tasks-#{Date.today}.xlsx" }
    end
  end
end
