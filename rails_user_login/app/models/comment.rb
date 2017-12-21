class Comment < ActiveRecord::Base
  #너는 게시글 하나에 속해있어.
  belongs_to :post
end
