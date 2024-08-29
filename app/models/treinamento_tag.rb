# frozen_string_literal: true

# == Schema Information
#
# Table name: treinamento_tags
#
#  id             :uuid             not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tag_id         :uuid             not null
#  treinamento_id :uuid             not null
#
# Indexes
#
#  index_treinamento_tags_on_tag_id          (tag_id)
#  index_treinamento_tags_on_treinamento_id  (treinamento_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (treinamento_id => treinamentos.id)
#
class TreinamentoTag < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :treinamento
  belongs_to :tag
  # validations ...............................................................
  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  # class methods .............................................................
  # instance methods ..........................................................
end
