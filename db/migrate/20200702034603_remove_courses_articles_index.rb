class RemoveCoursesArticlesIndex < ActiveRecord::Migration[6.0]
  def change
    remove_index :courses, name: "index_courses_on_articles_id"
  end
end
