class Article < ActiveRecord::Base
  attr_accessible :code, :journal_id, :pages, :supplementary_materials, :supporting_information,
                  :title, :abstract_attributes, :authors_attributes, :attachments_attributes

  has_one :abstract, dependent: :destroy
  has_many :authors, dependent: :destroy
  has_many :attachments, dependent: :destroy
  belongs_to :journal

  accepts_nested_attributes_for :abstract, allow_destroy: true
  accepts_nested_attributes_for :authors, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: :all_blank

  def optional_attachments
    attachments.where('description !=   ""')
  end



end
