class AddPaperClipFirledToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :image_file_name,    :string
    add_column :comments, :image_content_type, :string
    add_column :comments, :image_file_size,    :integer
    add_column :comments, :image_updated_at,   :datetime
  end
end
