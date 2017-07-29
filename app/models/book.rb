class Book < ApplicationRecord
  has_one :photo
  has_many :reviews

  validates_presence_of :author, :description, :title

  attr_accessor :cover

  after_save do
    cover_upload = CoverUploader.new
    cover_upload.store! self.cover
    if cover_upload.file.try(:exists?)
      self.create_photo url: cover_upload.file.path
                                              .gsub("#{Rails.root}/public", '')
    end
  end
end
