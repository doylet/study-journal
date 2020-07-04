class CreateGlossaries < ActiveRecord::Migration[6.0]
  def change
    create_table :glossaries do |t|
      t.string :title
      t.text :definition
      t.references :course, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
