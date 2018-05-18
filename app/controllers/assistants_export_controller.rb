class AssistantsExportController < ApplicationController
  def show 
    @assistant = Assistant.where(:attended => true)

    respond_to do |format|
      format.csv { send_data @assistant.to_csv, filename: "assistants-#{Date.today}.csv" }
    end
  end
end
