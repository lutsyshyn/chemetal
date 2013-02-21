class Assessment < ActiveRecord::Base

  attr_accessible :article_id, :novelty, :summary, :user_id, :importance, :title, :abstract, :keywords, :credit,
                  :clarity, :arguments, :reference, :tables, :illustrations, :language, :body

  belongs_to :user
  belongs_to :article

end
