class Admin::SiteidsController < ApplicationController
  before_action :set_admin_siteid, only: %i[ show edit update destroy ]

  # GET /admin/siteids or /admin/siteids.json
  def index
    binding.pry
    @admin_siteids = Admin::Siteid.all
  end

  # GET /admin/siteids/1 or /admin/siteids/1.json
  def show
  end

  # GET /admin/siteids/new
  def new
    @admin_siteid = Admin::Siteid.new
  end

  # GET /admin/siteids/1/edit
  def edit
  end

  # POST /admin/siteids or /admin/siteids.json
  def create
    @admin_siteid = Admin::Siteid.new(admin_siteid_params)

    respond_to do |format|
      if @admin_siteid.save
        format.html { redirect_to admin_siteid_url(@admin_siteid), notice: "Siteid was successfully created." }
        format.json { render :show, status: :created, location: @admin_siteid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_siteid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/siteids/1 or /admin/siteids/1.json
  def update
    respond_to do |format|
      if @admin_siteid.update(admin_siteid_params)
        format.html { redirect_to admin_siteid_url(@admin_siteid), notice: "Siteid was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_siteid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_siteid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/siteids/1 or /admin/siteids/1.json
  def destroy
    @admin_siteid.destroy

    respond_to do |format|
      format.html { redirect_to admin_siteids_url, notice: "Siteid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_siteid
      @admin_siteid = Admin::Siteid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_siteid_params
      params.require(:admin_siteid).permit(:site_ID, :site_Region, :site_Country, :site_Town, :site_Street, :site_NStreet, :site_Postal)
    end
end
