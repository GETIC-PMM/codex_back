# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_08_29_165928) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "autores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome"
    t.string "foto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorias", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treinamento_tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "treinamento_id", null: false
    t.uuid "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_treinamento_tags_on_tag_id"
    t.index ["treinamento_id"], name: "index_treinamento_tags_on_treinamento_id"
  end

  create_table "treinamentos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "titulo"
    t.string "resumo"
    t.uuid "categoria_id", null: false
    t.boolean "destaque_home", default: false, null: false
    t.uuid "autor_id", null: false
    t.date "data_publicacao"
    t.string "capa"
    t.text "corpo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autor_id"], name: "index_treinamentos_on_autor_id"
    t.index ["categoria_id"], name: "index_treinamentos_on_categoria_id"
  end

  add_foreign_key "treinamento_tags", "tags"
  add_foreign_key "treinamento_tags", "treinamentos"
  add_foreign_key "treinamentos", "autores"
  add_foreign_key "treinamentos", "categorias"
end
