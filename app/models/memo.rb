class Memo < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :date, presence: true
  validates :text_body, presence: true
  validates :user, presence: true
  has_attached_file :voice_file
  validates_attachment :voice_file, content_type: { content_type: ['audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio']}
end
