class AlterSectionsAddRowOrder < ActiveRecord::Migration[5.2]
  def change
    add_index :sections, :row_order
    add_column :sections, :row_order, :integer
  end
end
