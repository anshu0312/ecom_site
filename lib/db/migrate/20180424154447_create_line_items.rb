class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.string     :product_name
      t.references :order, index: true
      t.references :product, index: true
      t.integer    :product_quantity
      t.float      :product_price
      t.string     :product_size
      t.timestamps
    end
  end
end
