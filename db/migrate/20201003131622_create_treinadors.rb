class CreateTreinadors < ActiveRecord::Migration[6.0]
  def change
    create_table :treinadors do |t|
      t.string :nome, limit: 100
      t.integer :idade
      t.integer :sexo
      t.string :foto
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
