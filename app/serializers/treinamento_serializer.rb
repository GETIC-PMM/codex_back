# == Schema Information
#
# Table name: treinamentos
#
#  id              :uuid             not null, primary key
#  capa            :string           not null
#  corpo           :text             not null
#  data_publicacao :date             not null
#  destaque_home   :boolean          default(FALSE), not null
#  nome_do_autor   :string
#  resumo          :string           not null
#  thumbnail       :string
#  titulo          :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  autor_id        :string           not null
#  categoria_id    :uuid             not null
#
# Indexes
#
#  index_treinamentos_on_categoria_id  (categoria_id)
#
# Foreign Keys
#
#  fk_rails_...  (categoria_id => categorias.id)
#
class TreinamentoSerializer < ActiveModel::Serializer
  attributes :id, :titulo, :resumo, :categoria, :data_publicacao, :capa, :corpo, :autor_id, :destaque_home
  has_one :categoria
  has_many :tags, through: :treinamento_tag
end
