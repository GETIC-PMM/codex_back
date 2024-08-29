# frozen_string_literal: true

# == Schema Information
#
# Table name: autores
#
#  id         :uuid             not null, primary key
#  foto       :string
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AutorSerializer < ActiveModel::Serializer
  attributes :id, :nome
end
