class User < ActiveRecord::Base
  has_many :upvotes, foreign_key: 'songs_id'
  has_many :songs, foreign_key: 'users_id'
end