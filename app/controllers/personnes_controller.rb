class personnesController < ApplicationController
  helper_method :current_user
  before_action :set_Personne, only: %i[show edit update destroy]

  # GET /personnes or /personnes.json
  def index
    @personnes = Personne.all
  end

  # GET /personnes/1 or /personnes/1.json
  def show; end

  # GET /personnes/new
  def new
    @Personne = Personne.new
  end

  # GET /personnes/1/edit
  def edit; end

  # POST /personnes or /personnes.json
  def create
    @Personne = Personne.new(Personne_params)

    respond_to do |format|
      if @Personne.save
        format.html { redirect_to Personne_url(@Personne), notice: 'Personne was successfully created.' }
        format.json { render :show, status: :created, location: @Personne }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @Personne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personnes/1 or /personnes/1.json
  def update
    respond_to do |format|
      if @Personne.update(Personne_params)
        format.html { redirect_to Personne_url(@Personne), notice: 'Personne was successfully updated.' }
        format.json { render :show, status: :ok, location: @Personne }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @Personne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personnes/1 or /personnes/1.json
  def destroy
    @Personne.destroy

    respond_to do |format|
      format.html { redirect_to personnes_url, notice: 'Personne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_Personne
    @Personne = Personne.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def Personne_params
    params.require(:Personne).permit(:siteid, :fname, :lname, :cname, :matsnr, :mathr,
                                  :department, :service, :m1, :qualification, :bdate, :status)
  end
end
