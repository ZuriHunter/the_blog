class Comment < ActiveRecord::Base
  
  validates :body, :author, :presence => true
  belongs_to :post
end
