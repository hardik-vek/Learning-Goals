# frozen_string_literal: true

class Book < ApplicationRecord
  validates :name, :price, presence: true
  validates :name, length: { minimum: 4 }
end
