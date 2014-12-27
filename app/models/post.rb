class Post < ActiveRecord::Base
  has_many :articles
  validate :position
end