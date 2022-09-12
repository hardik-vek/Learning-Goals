# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { create :book }

  it 'valid book' do
    expect(book).to be_valid
  end

  it 'book have valid name ' do
    book.name = nil
    expect(book).to_not be_valid
  end

  it 'book have valid price ' do
    book.price = nil
    expect(book).to_not be_valid
  end

  it 'book have valid minimum size name  ' do
    book.name = 'tst'
    expect(book).to_not be_valid
  end
end
