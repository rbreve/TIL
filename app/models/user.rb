class User < ActiveRecord::Base
  has_many :snippets
  has_many :votes
  has_many :saves
  validates :username, :uniqueness => true, :presence => true
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.about = auth["user_info"]["description"]
      user.username=auth['user_info']['nickname']

    end
  end
end
