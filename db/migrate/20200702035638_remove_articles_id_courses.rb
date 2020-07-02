class RemoveArticlesIdCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :articles_id
  end
end
