class Snippet < ActiveRecord::Base
  versioned
  attr_accessible :name, :user_id, :code
  
end
