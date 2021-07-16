class Article < ApplicationRecord
  validates :name, presence: true
  validates :name, presence: true, length: { minimum: 6 }
end
