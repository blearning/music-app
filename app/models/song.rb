class Song < ActiveRecord::Base
  has_one :user
  has_many :upvotes, foreign_key: 'songs_id'
end