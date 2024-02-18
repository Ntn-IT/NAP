class EmpidsController < ApplicationController
  before_action :set_empid, only: %i[ show edit update destroy ]

  # GET /empids or /empids.json
  def index
    @empids = Empid.all
  end

  # GET /empids/1 or /empids/1.json
  def show
  end

  # GET /empids/new
  def new
    @empid = Empid.new
  end

  # GET /empids/1/edit
  def edit
  end

  # POST /empids or /empids.json
  def create
    @empid = Empid.new(empid_params)

    respond_to do |format|
      if @empid.save
        format.html { redirect_to empid_url(@empid), notice: "Empid was successfully created." }
        format.json { render :show, status: :created, location: @empid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empids/1 or /empids/1.json
  def update
    respond_to do |format|
      if @empid.update(empid_params)
        format.html { redirect_to empid_url(@empid), notice: "Empid was successfully updated." }
        format.json { render :show, status: :ok, location: @empid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empids/1 or /empids/1.json
  def destroy
    @empid.destroy

    respond_to do |format|
      format.html { redirect_to empids_url, notice: "Empid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empid
      @empid = Empid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empid_params
      params.require(:empid).permit(:emp_ID, :emp_SITEID, :emp_FName, :emp_LName, :emp_CName, :emp_Mat, :emp_MatHR, :emp_Department,:emp_qualification, :emp_Service, :emp_M1, :emp_PI_ID)
    end
end
