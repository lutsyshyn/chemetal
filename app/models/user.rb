class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :role_ids
  # attr_accessible :title, :body

  has_and_belongs_to_many :roles

  has_many :edits, class_name: "Article", foreign_key: "editor_id"

  #has_and_belongs_to_many :reviews, class_name: "Article"

  has_many :articles
  before_create :assign_role

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def assign_role
    role = Role.find_by_name("author")
    self.roles = [role]
  end

  def self.editors
    User.select {|user| user.has_role?(:editor)}
  end

end
