class AlterSessionsAddRowOrder < ActiveRecord::Migration
  def change
    add_column :sessions, :row_order, :integer
    add_index :sessions, :row_order
  end
end
