class NtnsiteidsController < ApplicationController
  before_action :set_ntnsiteid, only: %i[ show edit update destroy ]

  # GET /ntnsiteids or /ntnsiteids.json
  def index
    @ntnsiteids = Ntnsiteid.all
  end

  # GET /ntnsiteids/1 or /ntnsiteids/1.json
  def show
  end

  # GET /ntnsiteids/new
  def new
    @ntnsiteid = Ntnsiteid.new
  end

  # GET /ntnsiteids/1/edit
  def edit
  end

  # POST /ntnsiteids or /ntnsiteids.json
  def create
    @ntnsiteid = Ntnsiteid.new(ntnsiteid_params)

    respond_to do |format|
      if @ntnsiteid.save
        format.html { redirect_to ntnsiteid_url(@ntnsiteid), notice: "Ntnsiteid was successfully created." }
        format.json { render :show, status: :created, location: @ntnsiteid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ntnsiteid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ntnsiteids/1 or /ntnsiteids/1.json
  def update
    respond_to do |format|
      if @ntnsiteid.update(ntnsiteid_params)
        format.html { redirect_to ntnsiteid_url(@ntnsiteid), notice: "Ntnsiteid was successfully updated." }
        format.json { render :show, status: :ok, location: @ntnsiteid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ntnsiteid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ntnsiteids/1 or /ntnsiteids/1.json
  def destroy
    @ntnsiteid.destroy

    respond_to do |format|
      format.html { redirect_to ntnsiteids_url, notice: "Ntnsiteid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ntnsiteid
      @ntnsiteid = Ntnsiteid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ntnsiteid_params
      params.require(:ntnsiteid).permit(:site_ID, :site_Region, :site_Country, :site_Town, :site_Street, :site_NStreet, :site_Postal)
    end
end
