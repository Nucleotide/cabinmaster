class NeedsController < ApplicationController
  before_action :set_need, only: [:show, :edit, :update, :destroy]

  # GET /needs_steps.rb
  # GET /needs_steps.rb.json
  def index
    @needs = Need.all

    order = params[:order] || 'cabin'

    case order
      when 'cabin' then @needs.sort_by!{ |n| n.cabin_id }
      when 'user' then @needs.sort_by!{ |n| n.user_id }
      when 'info' then @needs.sort_by!{ |n| n.info }
    end
  end

  # GET /needs_steps.rb/1
  # GET /needs_steps.rb/1.json
  def show
  end

  # GET /needs_steps.rb/new
  def new
    @need = Need.new
    @cabins = Cabin.all
  end

  # GET /needs_steps.rb/1/edit
  def edit
    @cabins = Cabin.all
  end

  # POST /needs_steps.rb
  # POST /needs_steps.rb.json
  def create
    @need = Need.new(need_params)

    respond_to do |format|
      if @need.save
        current_user.needs << @need
        format.html { redirect_to needs_path, notice: 'Need was successfully created.' }
        format.json { render action: 'show', status: :created, location: @need }
      else
        @cabins = Cabin.all
        format.html { render action: 'new' }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /needs_steps.rb/1
  # PATCH/PUT /needs_steps.rb/1.json
  def update
    respond_to do |format|
      if @need.update(need_params)
        format.html { redirect_to needs_path, notice: 'Need was successfully updated.' }
        format.json { head :no_content }
      else
        @cabins = Cabin.all
        format.html { render action: 'edit' }
        format.json { render json: @need.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /needs_steps.rb/1
  # DELETE /needs_steps.rb/1.json
  def destroy
    @need.destroy
    respond_to do |format|
      format.html { redirect_to needs_url, notice: 'Need was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_need
      @need = Need.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def need_params
      params.require(:need).permit(:info, :cabin_id)
    end
end
