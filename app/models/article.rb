class Article < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 6 }
end
