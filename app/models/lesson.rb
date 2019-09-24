class Lesson < ApplicationRecord
  belongs_to :section
  has_many :sections
  mount_uploader :video, VideoUploader
end
