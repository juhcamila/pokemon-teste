class PokeApi
  attr_reader :nome, :tipo, :sprite_frontal

  def initialize(pokemon)
    poke_api = encontrar_pokemon(pokemon)
    preencher_dados_pokemon(poke_api)
  end

  def preencher_dados_pokemon(poke_api)
    unless poke_api.nil?
      @nome = poke_api["name"]
      @tipo = poke_api["types"].first["type"]["name"]
      @sprite_frontal = poke_api["sprites"]["front_default"]
    end
  end

  def encontrar_pokemon(pokemon)
    uri = Net::HTTP.get(URI("https://pokeapi.co/api/v2/pokemon/#{pokemon.downcase}"))
    unless uri == 'Not Found'
      ActiveSupport::JSON.decode(uri)
    end
  end
end
