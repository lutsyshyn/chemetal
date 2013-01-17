class Attachment < ActiveRecord::Base

  attr_accessible :article_id, :description, :file, :extension, :filename

  belongs_to :article

  before_save :gen_extension
  before_save :gen_filename

  mount_uploader :file, FileUploader

  def file_name_ext
    file.url.split("/").last if !file.blank?
  end

  def show

  end

  private

    def gen_extension
      self.extension = file_name_ext.split('.').last
    end

    def gen_filename
      self.filename = file_name_ext.split('.').first
    end

end
