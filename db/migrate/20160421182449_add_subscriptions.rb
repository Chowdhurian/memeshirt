class AddSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user
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
