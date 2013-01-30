class Role < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :users

  before_save { name.downcase! }
  validates :name, uniqueness: { case_sensitive: false }
end
