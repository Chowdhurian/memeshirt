class FixMeme < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :url
      t.integer :height
      t.integer :width
      t.timestamps
    end
  end
end
