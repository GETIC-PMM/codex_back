# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id         :uuid             not null, primary key
#  titulo     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TagSerializer < ActiveModel::Serializer
  attributes :id, :titulo
end
