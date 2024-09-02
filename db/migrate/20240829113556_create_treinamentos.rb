class CreateTreinamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :treinamentos, id: :uuid do |t|
      t.string :titulo, null: false
      t.string :resumo, null: false
      t.references :categoria, null: false, foreign_key: true, type: :uuid
      t.boolean :destaqueHome, default: false, null: false
      t.string :autor_id, null: false
      t.date :data_publicacao, null: false
      t.string :capa, null: false
      t.text :corpo, null: false

      t.timestamps
    end
  end
end
