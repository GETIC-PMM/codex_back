class AddNomeDoAutorToTreinamentos < ActiveRecord::Migration[7.2]
  def change
    add_column :treinamentos, :nome_do_autor, :string
  end
end
