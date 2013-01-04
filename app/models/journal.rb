class Journal < ActiveRecord::Base
  attr_accessible :issue, :pages, :volume, :year

  has_many :articles
end
