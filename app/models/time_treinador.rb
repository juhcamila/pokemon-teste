class TimeTreinador < ApplicationRecord
  validates :nome, presence: {message: "Campo deve ser preenchido corretamente"}, length: {maximum: 50}
  belongs_to :treinador, required: true
  has_many :pokemons, dependent: :delete_all
end
