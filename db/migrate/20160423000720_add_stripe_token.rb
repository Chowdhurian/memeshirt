class AddStripeToken < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :stripe_token
    end
  end
end
