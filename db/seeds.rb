# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

15.times do
  Categoria.create(
    titulo: Faker::Book.genre
  )
end

15.times do
  Tag.create(
    titulo: Faker::Books::Lovecraft.word
  )
end

15.times do
  f = File.open(Rails.root.join("app/assets/images/gato.jpg"))
  # copy the file to another file in the same directory
  FileUtils.cp(f.path, Rails.root.join("app/assets/images/gato_copy.jpg"))
  Treinamento.create(
    titulo: Faker::Books::Lovecraft.deity,
    resumo: Faker::Books::Lovecraft.fhtagn,
    corpo: Faker::Books::Lovecraft.paragraphs(number: 5).join("\n"),
    data_publicacao: Faker::Date.between(from: 2.weeks.ago, to: Time.zone.today),
    capa: File.new(Rails.root.join("app/assets/images/gato_copy.jpg")),
    autor_id: SecureRandom.uuid,
    categoria_id: Categoria.all.sample.id,
    tags: [Tag.all.sample, Tag.all.sample]
  )
end
