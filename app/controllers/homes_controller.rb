# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    @users = User.all
    @books = Book.all
  end
end
