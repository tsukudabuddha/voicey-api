class Memo < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :date, presence: true
  validates :text_body, presence: true
  validates :user, presence: true
end
