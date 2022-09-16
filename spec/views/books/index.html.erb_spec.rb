# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/index', type: :view do
  before(:each) do
    assign(:books, [
             Book.create!(
               name: 'Name',
               price: '9.99'
             ),
             Book.create!(
               name: 'Hardik',
               price: '100'
             )
           ])
  end

  it 'renders a list of books' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to include('Hardik')
  end
end
