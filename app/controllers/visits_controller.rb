class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all.order(:start_date)
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
  end

  def every
    @visits = Visit.all.order(:start_date)
  end

  # GET /visits/new
  def new
    @visit = Visit.new
    @cabins = Cabin.all
  end

  # GET /visits/1/edit
  def edit
    @cabins = Cabin.all
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(visit_params)

    respond_to do |format|
      if @visit.save
        current_user.visits << @visit
        format.html { redirect_to visits_path, notice: 'Luonti onnistui!' }
        format.json { render action: 'show', status: :created, location: @visit }
      else
        @cabins = Cabin.all
        format.html { render action: 'new' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to visits_path, notice: 'Muokkaus onnistui!' }
        format.json { head :no_content }
      else
        @cabins = Cabin.all
        format.html { render action: 'edit' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Poisto onnistui!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:start_date, :cabin_id, :end_date)
    end
end
