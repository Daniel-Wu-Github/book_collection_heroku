# spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'jk rowling'
    fill_in 'Price', with: 19.99
    select '2020', from: 'book_published_date_1i' # Year
    select 'September', from: 'book_published_date_2i' # Month
    select '20', from: 'book_published_date_3i' # Day
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('jk rowling')
  end
  # ... (Keep the invalid inputs scenario the same)
end