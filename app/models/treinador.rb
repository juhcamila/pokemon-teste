class Treinador < ApplicationRecord
  validates :nome, :idade, :sexo, :foto, presence: {message: "Campo deve ser preenchido"}
  validates :nome, length: {maximum: 100}

  belongs_to :user, required: true
  has_many :time_treinadors, dependent: :delete_all

  mount_uploader :foto, FotoUploader
end
