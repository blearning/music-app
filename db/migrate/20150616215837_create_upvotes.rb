class CreateUpvotes < ActiveRecord::Migration
  def change
      create_table :upvotes do |t|
      t.belongs_to :users, index: true
      t.belongs_to :songs, index: true
    end
  end
end
