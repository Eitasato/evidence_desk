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

ActiveRecord::Schema[8.1].define(version: 2026_10_16_093649) do
  create_table "evidence_links", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "passage_id", null: false
    t.string "decision"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["passage_id"], name: "index_evidence_links_on_passage_id"
    t.index ["question_id"], name: "index_evidence_links_on_question_id"
  end

  create_table "passages", force: :cascade do |t|
    t.integer "source_id", null: false
    t.text "body"
    t.string "heading_path"
    t.integer "page_index"
    t.integer "paragraph_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_passages_on_source_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "source_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_sources_on_url", unique: true
  end

  add_foreign_key "evidence_links", "passages"
  add_foreign_key "evidence_links", "questions"
  add_foreign_key "passages", "sources"
end
