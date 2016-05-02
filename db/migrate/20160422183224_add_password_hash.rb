class AddPasswordHash < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :password_hash
    end
  end
end
