class RenameIndexArticles < ActiveRecord::Migration[6.0]
  def change
    rename_index :articles, "index_articles_on_courses_id", "index_articles_on_course_id"
  end
end
