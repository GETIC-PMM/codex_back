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
class Treinamento < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :categoria
  has_many :treinamento_tags, dependent: :destroy
  has_many :tags, through: :treinamento_tags
  # validations ...............................................................
  validates :titulo, :resumo, :corpo, :data_publicacao, :capa, :nome_do_autor, presence: true
  validates :autor_id, uuid: true, presence: true
  # callbacks .................................................................
  # scopes ....................................................................
  scope :categoria_id, ->(categoria_id) { where(categoria_id:) }
  scope :tag_id, ->(tag_id) { joins(:tags).where(tags: {id: tag_id}) }
  scope :search,
    lambda { |query|
      where(
        "treinamentos.titulo ILIKE ?",
        "%#{query}%"
      ).or(where("resumo ILIKE ?", "%#{query}%"))
        .or(where("corpo ILIKE ?", "%#{query}%"))
    }
  # additional config .........................................................
  mount_base64_uploader :capa, ImageUploader
  mount_base64_uploader :thumbnail, ImageUploader
  # class methods .............................................................
  # public instance methods ...................................................
  # instance methods ..........................................................
end
