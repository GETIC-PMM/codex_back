class CreateCategorias < ActiveRecord::Migration[7.2]
  def change
    create_table :categorias, id: :uuid do |t|
      t.string :titulo, null: false

      t.timestamps
    end
  end
end
