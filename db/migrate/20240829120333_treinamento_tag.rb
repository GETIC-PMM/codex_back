# frozen_string_literal: true

class TreinamentoTag < ActiveRecord::Migration[7.2]
  def change
    create_table :treinamento_tags, id: :uuid do |t|
      t.references :treinamento, null: false, foreign_key: true, type: :uuid
      t.references :tag, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
