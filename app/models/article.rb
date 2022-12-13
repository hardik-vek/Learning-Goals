class Article < ApplicationRecord

  validates :title, :description, presence: true
  validates :description, length: { minimum: 10}
end
