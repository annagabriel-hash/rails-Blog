class User < ApplicationRecord
  before_save { username.downcase! }

  has_many :articles
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
end