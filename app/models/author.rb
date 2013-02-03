class Author < ActiveRecord::Base
  attr_accessible :article_id, :email, :first_name, :initials, :last_name

  belongs_to :article

  def name
    if first_name.present?
      name = initials
    else
      name = first_name
    end

    "#{name} #{last_name}"
  end

end
