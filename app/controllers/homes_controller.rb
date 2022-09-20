# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @authors = Author.all
    @books = Book.all
  end
end
