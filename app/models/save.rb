class Save < ActiveRecord::Base
  attr_accessible :snippet_id, :user_id
  belongs_to :user
  belongs_to :snippet
end
