class User < ActiveRecord::Base

  attr_accessible :email, :login, :password, :password_confirmation
  has_secure_password

  before_save{|user| user.email = email.downcase}

  validates :login, presence:true, length:{minimum:4, maximun:50}, uniqueness:{case_sensisive:true}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, format: {with:VALID_EMAIL_REGEX}, uniqueness:{case_sensisive:false}

  validates :password, presence:true, length:{minimum:6}
  validates :password_confirmation, presence:true

end
