class AddIntervalToSubscriptions < ActiveRecord::Migration
  def change
    change_table :subscriptions do |t|
      t.integer :interval
    end
  end
end
