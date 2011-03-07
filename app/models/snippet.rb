class Snippet < ActiveRecord::Base
#  versioned
  attr_accessible :name, :code, :description
  belongs_to :user
  has_many :reports
  has_many :votes
  has_many :saves
  
  acts_as_taggable
  acts_as_taggable_on :tags
  
  validates_presence_of :name, :code
  
  def is_fiddle()
    if self.code =~ /^((http|https):\/\/)?jsfiddle.net\/\w+/
      return true
    end
    return false
  end
  
  def vote(user_id)
      vote=Vote.new(:user_id=>user_id, :snippet_id=>self.id)
      vote.save()
  end
  
  def self.sortby(by)
    if by == "popular"
      order("votes_count DESC")
    elsif by == "recent"
      order("created_at DESC")
    else
      scoped
    end
  end
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
