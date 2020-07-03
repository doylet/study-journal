class AddCourseIndexToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :course, foreign_key: true
  end
end
