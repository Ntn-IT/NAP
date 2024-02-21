class Admin::ApisController < ApplicationController
  before_action :set_api, only: %i[ show edit update destroy ]

  # GET /apis or /apis.json
  def index
    @apis = api.all
  end

  # GET /apis/1 or /apis/1.json
  def show
  end

  # GET /apis/new
  def new
    @api = api.new
  end

  # GET /apis/1/edit
  def edit
  end

  # POST /apis or /apis.json
  def create
    binding.pry
    @api = api.new(api_params)

    respond_to do |format|
      if @api.save
        format.html { redirect_to api_url(@api), notice: "api was successfully created." }
        format.json { render :show, status: :created, location: @api }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apis/1 or /apis/1.json
  def update
    respond_to do |format|
      if @api.update(api_params)
        format.html { redirect_to api_url(@api), notice: "api was successfully updated." }
        format.json { render :show, status: :ok, location: @api }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apis/1 or /apis/1.json
  def destroy
    @api.destroy

    respond_to do |format|
      format.html { redirect_to apis_url, notice: "api was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api
      @api = api.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_params
      params.require(:api).permit(:api_mat, :user_id)
    end
end
