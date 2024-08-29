# frozen_string_literal: true

# == Schema Information
#
# Table name: treinamentos
#
#  id              :uuid             not null, primary key
#  capa            :string
#  corpo           :text
#  data_publicacao :date
#  destaqueHome    :boolean          default(FALSE), not null
#  resumo          :string
#  titulo          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  autor_id        :uuid             not null
#  categoria_id    :uuid             not null
#
# Indexes
#
#  index_treinamentos_on_autor_id      (autor_id)
#  index_treinamentos_on_categoria_id  (categoria_id)
#
# Foreign Keys
#
#  fk_rails_...  (autor_id => autores.id)
#  fk_rails_...  (categoria_id => categorias.id)
#
class TreinamentoSerializer < ActiveModel::Serializer
  attributes :id, :titulo, :resumo, :categoria, :data_publicacao, :capa, :corpo
  has_one :categoria
  has_one :autor
  has_many :tags, through: :treinamento_tag
end
