class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :title
      t.string :semester
      t.references :staff, null: false, foreign_key: true
      t.references :articles, null: false, foreign_key: true

      t.timestamps
    end
  end
end
