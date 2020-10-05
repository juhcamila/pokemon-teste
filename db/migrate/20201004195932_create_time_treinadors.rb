class CreateTimeTreinadors < ActiveRecord::Migration[6.0]
  def change
    create_table :time_treinadors do |t|
      t.belongs_to :treinador, null: false, foreign_key: true
      t.string :nome

      t.timestamps
    end
  end
end
