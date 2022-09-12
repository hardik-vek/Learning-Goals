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
               name: 'Name',
               price: '9.99'
             )
           ])
  end

  it 'renders a list of books' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
  end
end
