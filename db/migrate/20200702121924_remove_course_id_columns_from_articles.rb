class RemoveCourseIdColumnsFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :courses_id
    remove_column :articles, :course_id

  end
end
