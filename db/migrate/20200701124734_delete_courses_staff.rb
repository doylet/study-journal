class DeleteCoursesStaff < ActiveRecord::Migration[6.0]
  def change
    remove_index :courses, name: "index_courses_on_staff_id"
  end
end
