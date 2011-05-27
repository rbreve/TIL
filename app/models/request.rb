class Request < ActiveRecord::Base
  attr_accessible :user_id, :description
  belongs_to :user
end
