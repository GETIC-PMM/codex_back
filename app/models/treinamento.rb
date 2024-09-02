# frozen_string_literal: true

# == Schema Information
#
# Table name: treinamentos
#
#  id              :uuid             not null, primary key
#  capa            :string           not null
#  corpo           :text             not null
#  data_publicacao :date             not null
#  destaque_home   :boolean          default(FALSE), not null
#  resumo          :string           not null
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
class Treinamento < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :categoria
  has_many :treinamento_tags, dependent: :destroy
  has_many :tags, through: :treinamento_tags
  # validations ...............................................................
  validates :titulo, :resumo, :corpo, :data_publicacao, :capa, presence: true
  validates :autor_id, uuid: true, presence: true
  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  mount_base64_uploader :capa, ImageUploader
  # class methods .............................................................
  # instance methods ..........................................................
end
