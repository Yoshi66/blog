class Article < ActiveRecord::Base
  belongs_to :post
  validate :title
  validate :subtitle
  validate :content
end
