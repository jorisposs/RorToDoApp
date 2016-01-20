class ToDosController < ApplicationController
  before_action :set_to_do, only: [:show, :edit, :update, :destroy]

  # GET /to_dos
  # GET /to_dos.json
  def index
    @to_dos = ToDo.all
    
    render json: @todos 
  end

  # GET /to_dos/1
  # GET /to_dos/1.json
  def show
	render json: @to_do
  end

  # GET /to_dos/new
  def new
    @to_do = ToDo.new
  end

  # GET /to_dos/1/edit
  def edit
  end

  # POST /to_dos
  # POST /to_dos.json
  def create
    @to_do = ToDo.new(to_do_params)

    respond_to do |format|
      if @to_do.save
        render json: @to_do, notice: 'To do was successfully created.' }
        format.json { render :show, status: :created, location: @to_do }
      else
        format.html { render :new }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_dos/1
  # PATCH/PUT /to_dos/1.json
  def update
    respond_to do |format|
      if @to_do.update(to_do_params)
        render json: @to_do
       else
        render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_dos/1
  # DELETE /to_dos/1.json
  def destroy
    @to_do.destroy
    respond_to do |format|
      format.html { redirect_to to_dos_url, notice: 'To do was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do
      @to_do = ToDo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def to_do_params
      params.require(:to_do).permit(:start_date, :end_date, :priority, :description, :status)
    end
end
