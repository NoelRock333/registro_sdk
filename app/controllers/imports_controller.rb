class ImportsController < ApplicationController
  def new 
  end

  def create
    Import.import(params[:file])
    redirect_to root_url, notice: "Ya se importaron los datos!"
  end
end
