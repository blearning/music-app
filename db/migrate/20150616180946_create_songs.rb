class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :author
      t.string :url
      t.belongs_to :users, index: true
      t.timestamps
    end
  end
end
