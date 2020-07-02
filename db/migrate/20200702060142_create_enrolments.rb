class CreateEnrolments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrolments do |t|

      t.timestamps
    end
  end
end
