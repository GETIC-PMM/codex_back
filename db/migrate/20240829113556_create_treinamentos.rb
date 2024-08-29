# frozen_string_literal: true

class CreateTreinamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :treinamentos, id: :uuid do |t|
      t.string :titulo
      t.string :resumo
      t.references :categoria, null: false, foreign_key: true, type: :uuid
      t.boolean :destaqueHome, default: false, null: false
      t.references :autor, null: false, foreign_key: true, type: :uuid
      t.date :data_publicacao
      t.string :capa
      t.text :corpo

      t.timestamps
    end
  end
end
