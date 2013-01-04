class Abstract < ActiveRecord::Base
  attr_accessible :content, :keywords, :article_id

  belongs_to :article
end
