class Api < ActiveRecord::Base
  validates :tag, :uniqueness => true 
end
