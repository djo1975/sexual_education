class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table "journals", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.text "content"
      t.date "last_entry_date"
      t.integer "counter", default: 0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_journals_on_user_id"
    end
  end
end