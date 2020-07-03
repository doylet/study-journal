class DropDefinitionsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :definitions
  end
end
