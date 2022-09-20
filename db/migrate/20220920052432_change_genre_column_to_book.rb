# frozen_string_literal: true

class ChangeGenreColumnToBook < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :genre, :integer
  end
end
