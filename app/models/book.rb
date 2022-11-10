# frozen_string_literal: true

class Book < ApplicationRecord
  validates :name, :price, :genre, presence: true
  validates :name, length: { minimum: 4 }
  belongs_to :user
  enum :genre, %i[fiction non_fiction]
end
