class Article < ActiveRecord::Base
  attr_accessible :code, :journal_id, :pages, :supplementary_materials, :supporting_information, :title

  has_many :abstracts
  has_many :authors
  belongs_to :journal

end
