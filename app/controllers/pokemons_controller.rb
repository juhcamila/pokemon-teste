class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:destroy]
  before_action :set_time, only: [:buscar, :adicionar, :destroy]

  def buscar
    @pokemon = nil
    unless params["search"].nil?
      @pokemon = PokeApi.new(params["search"])
    end
  end

  def adicionar
    @pokemon = PokeApi.new(params["nome"])
    if @time_treinador.pokemons.size >= 6
      respond_to do |format|
        format.html { redirect_to time_treinador_path(@time_treinador), notice: 'Não é permitido acima de 6 Pokemons' }
        format.json { head :no_content }
      end
    else
      if Pokemon.find_by(nome: @pokemon.nome, time_treinador_id: @time_treinador.id)
        respond_to do |format|
          format.html { redirect_to time_treinador_path(@time_treinador), notice: 'Já existe esse pokemon no seu time' }
          format.json { head :no_content }
        end
      else
        @pokemon =
            Pokemon.new(nome: @pokemon.nome, tipo: @pokemon.tipo, sprite: @pokemon.sprite_frontal, time_treinador_id: @time_treinador.id)

        respond_to do |format|
          if @pokemon.save
            format.html { redirect_to time_treinador_path(@time_treinador), notice: 'Pokemon adicionado com sucesso' }
          else
            format.html { render :buscar }
            format.json { render json: @pokemon.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to time_treinador_path(@time_treinador), notice: 'Pokemon deletado com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    def set_time
      @time_treinador = TimeTreinador.find(params[:time_treinador_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:nome, :tipo, :sprint, :time_treinador_id)
    end
end
