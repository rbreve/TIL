class User < ActiveRecord::Base
  has_many :snippets
  has_many :votes
  has_many :saves
  has_many :requests
  
  validates :username, :uniqueness => true, :presence => true
  
  def self.karma(points)
    self.karma += points
    self.save()
  end
  
  def get_avatar()
    if self.provider == "facebook"
      return "http://graph.facebook.com/" + self.username + "/picture"
    end
    
    if self.provider == "twitter"
      self.avatar
    end
  end
  
  def self.create_with_omniauth(auth)
    create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["user_info"]["name"]
        user.about = auth["user_info"]["description"]
        user.username=auth['user_info']['nickname']
        user.email=auth['user_info']['email']
        user.avatar=auth['user_info']['profile_image_url']
      end

   end
end
