class AddFieldToTag < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :description, :text
  end
end
