class Article < ActiveRecord::Base
  attr_accessible :code, :journal_id, :pages, :supplementary_materials, :supporting_information,
                  :title, :abstract_attributes, :authors_attributes, :pdf, :remove_pdf, :pdf_url

  has_one :abstract, dependent: :destroy
  has_many :authors, dependent: :destroy
  belongs_to :journal

  accepts_nested_attributes_for :abstract, allow_destroy: true

  accepts_nested_attributes_for :authors, allow_destroy: true, reject_if: :all_blank

  mount_uploader :pdf, FileUploader

end
