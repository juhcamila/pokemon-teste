class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :nome
      t.string :tipo
      t.string :sprite
      t.belongs_to :time_treinador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
