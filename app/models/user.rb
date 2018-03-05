class User < ApplicationRecord
  belongs_to :user, optional: true # needed to add optional: true to pass tests
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
