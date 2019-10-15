class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table "sections", force: :cascade do |t|
     t.string "title"
     t.integer "course_id"
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
     t.index ["course_id"], name: "index_sections_on_course_id"
    end
    add_index :courses, :user_id
  end
end