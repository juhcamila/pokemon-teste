json.extract! treinador, :id, :nome, :idade, :sexo, :created_at, :updated_at
json.url treinador_url(treinador, format: :json)
