class SuppliesController < ApplicationController
  before_action :set_supply, only: [:show, :edit, :update, :destroy]

  # GET /supplies
  # GET /supplies.json
  def index
    @supplies = Supply.all

    order = params[:order] || 'cabin'

    case order
      when 'cabin' then @supplies.sort_by!{ |s| s.cabin_id }
      when 'user' then @supplies.sort_by!{ |s| s.user_id }
      when 'info' then @supplies.sort_by!{ |s| s.info }
    end
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show
  end

  # GET /supplies/new
  def new
    @supply = Supply.new
    @cabins = Cabin.all
  end

  # GET /supplies/1/edit
  def edit
    @cabins = Cabin.all
  end

  # POST /supplies
  # POST /supplies.json
  def create
    @supply = Supply.new(supply_params)

    respond_to do |format|
      if @supply.save
        current_user.supplies << @supply
        format.html { redirect_to supplies_path, notice: 'Supply was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supply }
      else
        @cabins = Cabin.all
        format.html { render action: 'new' }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    respond_to do |format|
      if @supply.update(supply_params)
        format.html { redirect_to supplies_path, notice: 'Supply was successfully updated.' }
        format.json { head :no_content }
      else
        @cabins = Cabin.all
        format.html { render action: 'edit' }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @supply.destroy
    respond_to do |format|
      format.html { redirect_to supplies_url, notice: 'Supply was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply
      @supply = Supply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_params
      params.require(:supply).permit(:info, :cabin_id)
    end
end
