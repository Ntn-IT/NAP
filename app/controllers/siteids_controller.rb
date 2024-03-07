# frozen_string_literal: true

class SiteidsController < ApplicationController
  before_action :set_siteid, only: %i[show edit update destroy]

  # GET /siteids or /siteids.json
  def index
    binding.pry
    @siteids = Siteid.all
  end

  # GET /siteids/1 or /siteids/1.json
  def show; end

  # GET /siteids/new
  def new
    @siteid = Siteid.new
  end

  # GET /siteids/1/edit
  def edit; end

  # POST /siteids or /siteids.json
  def create
    @siteid = Siteid.new(siteid_params)

    respond_to do |format|
      if @siteid.save
        format.html { redirect_to siteid_url(@siteid), notice: 'Siteid was successfully created.' }
        format.json { render :show, status: :created, location: @siteid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @siteid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /siteids/1 or /siteids/1.json
  def update
    respond_to do |format|
      if @siteid.update(siteid_params)
        format.html { redirect_to siteid_url(@siteid), notice: 'Siteid was successfully updated.' }
        format.json { render :show, status: :ok, location: @siteid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @siteid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /siteids/1 or /siteids/1.json
  def destroy
    @siteid.destroy

    respond_to do |format|
      format.html { redirect_to siteids_url, notice: 'Siteid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_siteid
    @siteid = Siteid.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def siteid_params
    params.require(:siteid).permit(:site_ID, :site_Region, :site_Country, :site_Town, :site_Street, :site_NStreet,
                                   :site_Postal)
  end
end
