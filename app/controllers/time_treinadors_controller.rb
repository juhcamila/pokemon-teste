class TimeTreinadorsController < ApplicationController
  before_action :set_time_treinador, only: [:show, :edit, :update, :destroy]
  before_action :set_treinador, only: [:index, :create]
  before_action :authenticate_user!

  # GET /time_treinadors
  # GET /time_treinadors.json
  def index
    @time_treinadors = TimeTreinador.where(treinador_id: @treinador.id)
  end

  # GET /time_treinadors/1
  # GET /time_treinadors/1.json
  def show
    @pokemons = Pokemon.where(time_treinador_id: @time_treinador.id)
  end

  # GET /time_treinadors/new
  def new
    @time_treinador = TimeTreinador.new
  end

  # GET /time_treinadors/1/edit
  def edit
  end

  # POST /time_treinadors
  # POST /time_treinadors.json
  def create
    @time_treinador = TimeTreinador.new(time_treinador_params)
    @time_treinador.treinador = @treinador

    respond_to do |format|
      if @time_treinador.save
        format.html { redirect_to @time_treinador, notice: 'Time criado com sucesso' }
        format.json { render :show, status: :created, location: @time_treinador }
      else
        format.html { render :new }
        format.json { render json: @time_treinador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_treinadors/1
  # PATCH/PUT /time_treinadors/1.json
  def update
    respond_to do |format|
      if @time_treinador.update(time_treinador_params)
        format.html { redirect_to @time_treinador, notice: 'Time alterado com sucesso' }
        format.json { render :show, status: :ok, location: @time_treinador }
      else
        format.html { render :edit }
        format.json { render json: @time_treinador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_treinadors/1
  # DELETE /time_treinadors/1.json
  def destroy
    @time_treinador.destroy
    respond_to do |format|
      format.html { redirect_to time_treinadors_url, notice: 'Time deletado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    def set_treinador
      @treinador = Treinador.find_by(user_id: current_user.id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_time_treinador
      @time_treinador = TimeTreinador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_treinador_params
      params.require(:time_treinador).permit(:treinador_id_id, :nome)
    end
end
