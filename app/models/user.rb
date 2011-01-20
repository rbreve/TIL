class User < ActiveRecord::Base
  has_many :snippets
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.about = auth["user_info"]["description"]
    end
  end
end
