# frozen_string_literal: true

require 'rails_helper'

feature 'Creating flow by Admin: ' do
  let!(:user) { Administrator.create(email: 'john1@example.com', password: 'sEcReT321') }
  let!(:recipe) { FactoryBot.create(:recipe) }
  let!(:name) { 'Name' }

  before do
    visit '/users/sign_in'

    within('#new_user') do
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
    end

    click_button 'Log in'
  end

  scenario 'User creates recipe' do
    visit new_recipe_path

    within('form') do
      fill_in 'Recipe name', with: recipe.name
      fill_in 'Description', with: recipe.description
      select recipe.preparation_kind, from: 'Preparation_kind'
      fill_in 'Preparation_time', with: recipe.preparation_time

      click_on 'Add ingredient'

      click_button 'Add recipe'
    end

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.description
    expect(page).to have_content recipe.preparation_kind
    expect(page).to have_content recipe.preparation_time
  end

  scenario 'User edits recipe' do
    visit recipe_path(recipe)

    click_on 'Edit'

    within('form') do
      fill_in :name, with: name

      click_button 'Submit'
    end

    expect(page).to have_content name
  end
end
