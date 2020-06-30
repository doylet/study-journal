class AddNewFieldAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :answer, :text
    rename_column :articles, :body, :question
  end

end
