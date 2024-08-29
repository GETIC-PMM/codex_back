# frozen_string_literal: true

class CreateAutores < ActiveRecord::Migration[7.2]
  def change
    create_table :autores, id: :uuid do |t|
      t.string :nome
      t.string :foto

      t.timestamps
    end
  end
end
