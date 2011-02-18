class User < ActiveRecord::Base
  has_many :snippets
  has_many :votes
  has_many :saves
  validates_uniqueness_of :username
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.about = auth["user_info"]["description"]
      userusername=auth['user_info']['nickname']

    end
  end
end
