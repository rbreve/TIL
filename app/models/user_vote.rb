class UserVote < ActiveRecord::Base
  has_many :user
  has_many :vote
end
