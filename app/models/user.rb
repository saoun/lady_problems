class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :feedbacks
  has_many :pitches
end
