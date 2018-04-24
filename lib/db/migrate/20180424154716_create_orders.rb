class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string 		 :status
      t.float		   :total
      t.timestamps
    end
  end
end
