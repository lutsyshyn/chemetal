class Journal < ActiveRecord::Base
  attr_accessible :issue, :pages, :volume, :year, :month, :published

  has_many :articles, dependent: :destroy

  def self.published
    Journal.where(published: true)
  end

  def self.unpublished
    Journal.where(published: false)
  end

end
