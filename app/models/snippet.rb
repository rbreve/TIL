class Snippet < ActiveRecord::Base
#  versioned
  attr_accessible :name, :code, :description
  belongs_to :user
  has_many :votes
  acts_as_taggable
  acts_as_taggable_on :tags
  
  validates_presence_of :name, :code
  
  
  def vote(user_id)
      vote=Vote.new(:user_id=>user_id, :snippet_id=>self.id)
      vote.save()
  end
  
end
