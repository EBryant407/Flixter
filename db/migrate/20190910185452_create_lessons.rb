class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table "lessons", force: :cascade do |t|
      t.string "title"
      t.string "subtitle"
      t.integer "section_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "video"
      t.integer "row_order"
      t.index ["row_order"], name: "index_lessons_on_row_order"
      t.index ["section_id"], name: "index_lessons_on_section_id"
    end
    
  

    create_table "sections", force: :cascade do |t|
     t.string "title"
     t.integer "course_id"
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
     t.index ["course_id"], name: "index_sections_on_course_id"
    end

end
