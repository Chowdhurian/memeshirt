class OrdersTable < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :meme_id
      t.references :subscription
      t.string :gender
      t.string :size
      t.string :address
      t.string :city 
      t.string :country
      t.string :postal_code
      t.timestamps
    end
  end
end
