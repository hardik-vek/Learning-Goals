# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/books', type: :request do
  include Devise::Test::IntegrationHelpers

  context "when user is not logged in" do
    it 'render a page to sign in' do
      get books_url
      expect(response).to redirect_to(new_user_session_url)
      expect(response).to redirect_to('/users/sign_in')
    end
  end
  
  context "when user is logged in" do
    
    before do 
      @user = create :user 
      @book = create :book, user_id: @user.id
      sign_in(@user)
    end

    describe 'GET /index' do
      it 'renders a successful response' do
        get books_url
        expect(response).to have_http_status(200)
      end
    end
    
    describe 'GET /show' do
      it 'renders a successful response' do
        get book_url(@book)
        expect(response).to have_http_status(200)
      end
    end
    
    describe 'GET /new' do
      it 'renders a successful response' do
        get new_book_url
        expect(response).to have_http_status(200)
      end
    end
    
    describe 'POST /create' do
      context 'with valid parameters' do
        it 'creates a new Book' do
          expect do
            post books_url, params: { book: { name: 'test', price: 100, user_id: @user.id, genre: "fiction"} }
          end.to change(Book, :count).by(1)
        end
        
        it 'redirects to the created book' do
          post books_url, params: { book: { name: 'test', price: 100, user_id: @user.id, genre: "fiction" } }
          expect(response).to redirect_to(root_url)
        end
      end
      
      context 'with invalid parameters' do
        it 'does not create a new Book' do
          expect do
            post books_url, params: { book: { price: 100 } }
          end.to change(Book, :count).by(0)
        end
        
        it "renders a successful response (i.e. to display the 'new' template)" do
          post books_url, params: { book: { price: 100 } }
          expect(response).to have_http_status(422)
        end
      end
    end
    
    describe 'GET /edit' do
      it 'renders a successful response' do
        get edit_book_url(@book)
        expect(response).to have_http_status(200)
      end
    end
    
    describe 'PATCH /update' do
      context 'with valid parameters' do
        it 'updates the requested book' do
          patch book_url(@book), params: { book: { name: 'test' } }
          @book.reload
        end
        
        it 'redirects to the book' do
          patch book_url(@book), params: { book: { name: 'test' } }
          @book.reload
          expect(response).to redirect_to(root_url)
        end
      end
      
      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          patch book_url(@book), params: { book: { name: 'tst' } }
          expect(response).to have_http_status(422)
        end
      end
    end
    
    describe 'DELETE /destroy' do
      it 'destroys the requested book' do
        expect do
          delete book_url(@book)
        end.to change(Book, :count).by(-1)
      end
      
      it 'redirects to the books list' do
        delete book_url(@book)
        expect(response).to redirect_to(root_url)
      end
    end

    context 'when book is not created by same user' do
      
      before do
        @book = create :book
      end

      describe 'GET /edit' do
        it 'redirect to root page' do
          get edit_book_url(@book)
          expect(response).to have_http_status(302)
        end
      end   

      describe 'DELETE /destroy' do
        it 'redirect to root page' do
          delete book_url(@book)
          expect(response).to have_http_status(302)
        end
      end
    end

    context 'when user is logged out' do
      it 'return unauthorized satus' do
        sign_out(@user)
        get books_url
        expect(response).to have_http_status(302)
        follow_redirect!
        expect(response).to have_http_status(200)
      end  
    end

  end 
end
