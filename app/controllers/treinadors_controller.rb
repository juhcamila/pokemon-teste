class TreinadorsController < ApplicationController
  before_action :set_treinador, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create]

  # GET /treinadors
  # GET /treinadors.json
  def index
    @treinadors = Treinador.all
  end

  # GET /treinadors/1
  # GET /treinadors/1.json
  def show
  end

  # GET /treinadors/new
  def new
    @treinador = Treinador.new
    render layout: 'login'
  end

  # GET /treinadors/1/edit
  def edit
  end

  # POST /treinadors
  # POST /treinadors.json
  def create
    @treinador = Treinador.new(treinador_params)
    @treinador.user = @user

    respond_to do |format|
      if @treinador.save
        format.html { redirect_to @treinador, notice: 'Treinador criado com sucesso' }
        format.json { render :show, status: :created, location: @treinador }
      else
        format.html { render :new }
        format.json { render json: @treinador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treinadors/1
  # PATCH/PUT /treinadors/1.json
  def update
    respond_to do |format|
      if @treinador.update(treinador_params)
        format.html { redirect_to @treinador, notice: 'Treinador alterado com sucesso' }
        format.json { render :show, status: :ok, location: @treinador }
      else
        format.html { render :edit }
        format.json { render json: @treinador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treinadors/1
  # DELETE /treinadors/1.json
  def destroy
    @treinador.destroy
    sign_out
    binding.pry
    @treinador.user.destroy
    respond_to do |format|
      format.html { redirect_to treinadors_url, notice: 'Treinador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_treinador
      @treinador = Treinador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treinador_params
      params.require(:treinador).permit(:nome, :idade, :sexo, :foto)
    end
end
