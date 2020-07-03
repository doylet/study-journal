class RemoveCoursesIndexFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :courses_id
  end
end
