class AlterSectionsAddRowOrder < ActiveRecord::Migration[5.2]
  def change
    add_index :sections, :row_order
  end
end
