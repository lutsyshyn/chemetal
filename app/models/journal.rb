class Journal < ActiveRecord::Base
  attr_accessible :issue, :pages, :volume, :year, :month

  has_many :articles, dependent: :destroy
end
