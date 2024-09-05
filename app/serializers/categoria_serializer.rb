# == Schema Information
#
# Table name: categorias
#
#  id         :uuid             not null, primary key
#  titulo     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CategoriaSerializer < ActiveModel::Serializer
  attributes :id, :titulo

  has_many :treinamentos, if: :show_treinamentos

  def show_treinamentos
    @instance_options[:show_treinamentos]
  end
end
