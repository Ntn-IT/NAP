class Admin::entretiensController < ApplicationController
  helper_method :current_user
  before_action :set_entretien, only: %i[show edit update destroy]

  # GET /entretiens or /entretiens.json
  def index
    @entretiens = entretien.all
  end

  # GET /entretiens/1 or /entretiens/1.json
  def show; end

  # GET /entretiens/new
  def new
    @entretien = entretien.new
  end

  # GET /entretiens/1/edit
  def edit; end

  # POST /entretiens or /entretiens.json
  def create
    #binding.pry
    @entretien = entretien.new(entretien_params)

    respond_to do |format|
      if @entretien.save
        format.html { redirect_to entretien_url(@entretien), notice: 'entretien was successfully created.' }
        format.json { render :show, status: :created, location: @entretien }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entretien.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entretiens/1 or /entretiens/1.json
  def update
    respond_to do |format|
      if @entretien.update(entretien_params)
        format.html { redirect_to entretien_url(@entretien), notice: 'entretien was successfully updated.' }
        format.json { render :show, status: :ok, location: @entretien }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entretien.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entretiens/1 or /entretiens/1.json
  def destroy
    @entretien.destroy

    respond_to do |format|
      format.html { redirect_to entretiens_url, notice: 'entretien was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entretien
    @entretien = entretien.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entretien_params
    params.require(:entretien).permit(:entretien_mat, :user_id)
  end
end
