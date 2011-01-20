class Snippet < ActiveRecord::Base
  versioned
  attr_accessible :name, :user_id, :code
  belongs_to :user
end
