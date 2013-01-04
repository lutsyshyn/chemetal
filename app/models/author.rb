class Author < ActiveRecord::Base
  attr_accessible :article_id, :email, :first_name, :initials, :last_name

  belongs_to :article
end
