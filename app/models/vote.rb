class Vote < ActiveRecord::Base
  belongs_to :user
    belongs_to :snippet, :counter_cache => true
end
