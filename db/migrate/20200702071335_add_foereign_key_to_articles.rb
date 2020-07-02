class AddFoereignKeyToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :courses, foreign_key: true
  end
end
