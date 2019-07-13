# frozen_string_literal: true

require 'rails_helper'

feature 'Creating flow by Admin: ' do
  let!(:user)      { Administrator.create(email: 'john1@example.com', password: 'sEcReT321') }
  let!(:product)   { FactoryBot.create(:product) }
  let!(:name)      { 'Name' }

  before do
    visit '/users/sign_in'

    within('#new_user') do
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
    end

    click_button 'Log in'
  end

  scenario 'User creates product' do
    visit new_product_path

    within('form') do
      fill_in 'Product name', with: product.name
      select product.category, from: 'Category of product'
      fill_in 'Calories', with: product.kal

      click_button 'Add product'
    end

    expect(page).to have_content product.name
    expect(page).to have_content product.category
    expect(page).to have_content product.kal
  end

  scenario 'User edits product' do
    visit product_path(product)

    click_on 'Edit'

    within('form') do
      fill_in :name, with: name

      click_button 'Submit'
    end

    expect(page).to have_content name
  end
end
