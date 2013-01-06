class Article < ActiveRecord::Base
  attr_accessible :code, :journal_id, :pages, :supplementary_materials, :supporting_information, :title, :abstract_attributes, :authors_attributes

  has_one :abstract
  has_many :authors
  belongs_to :journal

  accepts_nested_attributes_for :abstract, allow_destroy: true

  accepts_nested_attributes_for :authors, allow_destroy: true

end
