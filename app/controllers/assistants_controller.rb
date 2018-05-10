class AssistantsController < ApplicationController
  before_action :set_assistant, only: [:show, :edit, :update, :destroy]

  # GET /assistants
  # GET /assistants.json
  def index
    @assistants = Assistant.all
  end

  # GET /assistants/1
  # GET /assistants/1.json
  def show
  end

  # GET /assistants/new
  def new
    @assistant = Assistant.new
  end

  # GET /assistants/1/edit
  def edit
  end

  def mark
    @assistant = Assistant.find(params[:id]) 
    respond_to do |format|
      if @assistant.update(:attended => params[:attended])
        # Pusher.trigger('my-channel', 'my-event', {
        #   assistant: @assistant.to_json
        # });
        format.json { render json: {}, status: :ok }
      else 
        format.json { render json: @assistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /assistants
  # POST /assistants.json
  def create
    @assistant = Assistant.new(assistant_params.merge(:attended => true, :ticket_quantity => 1))

    respond_to do |format|
      if @assistant.save
        format.html { redirect_to @assistant, notice: 'Assistant was successfully created.' }
        format.json { render :show, status: :created, location: @assistant }
      else
        format.html { render :new }
        format.json { render json: @assistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assistants/1
  # PATCH/PUT /assistants/1.json
  def update
    respond_to do |format|
      if @assistant.update(assistant_params)
        format.html { redirect_to @assistant, notice: 'Assistant was successfully updated.' }
        format.json { render :show, status: :ok, location: @assistant }
      else
        format.html { render :edit }
        format.json { render json: @assistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assistants/1
  # DELETE /assistants/1.json
  def destroy
    @assistant.destroy
    respond_to do |format|
      format.html { redirect_to assistants_url, notice: 'Assistant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assistant
      @assistant = Assistant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assistant_params
      params.require(:assistant).permit(:reservation_code, :name, :last_name, :email, :notes, :pay_method, :ticket_quantity, :reservation_date, :attended)
    end
end
