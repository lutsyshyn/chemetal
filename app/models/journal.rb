class Journal < ActiveRecord::Base
  attr_accessible :issue, :pages, :volume, :year, :month, :published, :visible

  has_many :articles, dependent: :destroy

  #scope :published => { where(published: true) }

  def self.published
    Journal.where(published: true)
  end

  def self.unpublished
    Journal.where(published: false)
  end

  def self.visible
    Journal.where(visible: true)
  end

end
