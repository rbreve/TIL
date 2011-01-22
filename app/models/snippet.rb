class Snippet < ActiveRecord::Base
  versioned
  attr_accessible :name, :code, :description
  belongs_to :user
  acts_as_taggable
  acts_as_taggable_on :tags
  
  validates_presence_of :name, :code
  
end
