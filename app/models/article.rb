class Article < ActiveRecord::Base
  attr_accessible :code, :journal_id, :pages, :supplementary_materials, :supporting_information,
                  :title, :abstract_attributes, :authors_attributes, :attachments_attributes, :user_id,
                  :proofed, :locked, :visible, :editor_id

  has_one :abstract, dependent: :destroy
  has_many :authors, dependent: :destroy
  has_many :attachments, dependent: :destroy

  belongs_to :editor, class_name: "User"

  #has_and_belongs_to_many :reviewers, class_name: "User"

  belongs_to :journal

  accepts_nested_attributes_for :abstract, allow_destroy: true
  accepts_nested_attributes_for :authors, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: :all_blank

  def optional_attachments
    attachments.where('description !=   ""')
  end

  def self.proofed
    Article.where(proofed: true)
  end

  def has_full_pdf?
    Attachment.find_by_article_id_and_extension_and_description(id, 'pdf', '') != nil
  end

  def self.visible
    Article.where(visible: true)
  end

end
