class AddColumnsToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :product_desc, :string
  end
end
