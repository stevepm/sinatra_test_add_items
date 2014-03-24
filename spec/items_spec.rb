require 'capybara/rspec'
require 'spec_helper'
require_relative '../app'

Capybara.app = App

feature 'Managing items' do
  scenario 'add items' do
    visit '/'

    expect(page).to have_title("Edit apps")

    expect(page).to have_content('Channa Masala')
    expect(page).to have_content('Saag Paneer')

    click_link 'New Item'
    fill_in 'new_item', :with => 'Naan'
    click_on 'Add Item'

    expect(page).to have_content('Naan')

  end
end