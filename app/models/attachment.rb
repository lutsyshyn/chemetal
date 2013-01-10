class Attachment < ActiveRecord::Base

  attr_accessible :article_id, :description, :file, :extension

  belongs_to :article

  before_save :gen_extension

  mount_uploader :file, FileUploader

  def filename
    file.url.split("/").last if !file.blank?
  end

  private

    def gen_extension
      self.extension = filename.split('.').last
    end

end
