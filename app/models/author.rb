# frozen_string_literal: true

class Author < ApplicationRecord
  validates :name, :age, presence: true
  validates :name, length: { minimum: 2 }
  has_many :books, dependent: :destroy
end
