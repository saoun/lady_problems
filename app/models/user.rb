class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :feedbacks
  has_many :pitches

  def self.create_with_omniauth(auth)

    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.img = auth["info"]["image"]
    end
  end

end
