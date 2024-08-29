# frozen_string_literal: true

FactoryBot.define do
  factory :treinamento do
    titulo { "MyString" }
    resumo { "MyString" }
    categoria { nil }
    tag { nil }
    destaqueHome { false }
    autor { nil }
    data { "2024-08-29" }
    capa { "MyString" }
    corpo { "MyText" }
  end
end
