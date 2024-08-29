# frozen_string_literal: true

# == Schema Information
#
# Table name: treinamentos
#
#  id              :uuid             not null, primary key
#  capa            :string
#  corpo           :text
#  data_publicacao :date
#  destaque_home   :boolean          default(FALSE), not null
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
class Treinamento < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :categoria
  belongs_to :autor
  has_many :treinamento_tags, dependent: :destroy
  has_many :tags, through: :treinamento_tags
  # validations ...............................................................
  validates :titulo, :resumo, :corpo, :data_publicacao, :capa, presence: true
  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  mount_base64_uploader :capa, ImageUploader
  # class methods .............................................................
  # instance methods ..........................................................
end
