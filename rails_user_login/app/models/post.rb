class Post < ActiveRecord::Base
  # 댓글'들'을 가지고 있다.
  has_many :comments
end
