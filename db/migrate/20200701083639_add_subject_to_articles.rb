class AddSubjectToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :subject, :string
  end
end
