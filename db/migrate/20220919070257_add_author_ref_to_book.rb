# frozen_string_literal: true

class AddAuthorRefToBook < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :author, null: false, foreign_key: true
  end
end
