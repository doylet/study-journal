class AddCourseIdToArticles < ActiveRecord::Migration[6.0]
  def change
    remove_index :articles, name: "index_articles_on_course_id"
    add_reference :articles, :course, foreign_key: true

  end
end
