class Upvote < ActiveRecord::Base

  belongs_to :users, class_name: User
  belongs_to :songs, class_name: Song
end