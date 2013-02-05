class Assignment < ActiveRecord::Base

  attr_accessible :article_id, :user_id

  belongs_to :reviewer, class_name: "User", foreign_key: "user_id"
  belongs_to :review, class_name: "Article", foreign_key: "article_id"

end
