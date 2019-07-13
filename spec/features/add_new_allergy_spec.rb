# frozen_string_literal: true

require 'rails_helper'

feature 'creating a new allergy' do
  let!(:user) { Administrator.create(email: 'john1@example.com', password: 'sEcReT321') }

  before do
    visit '/users/sign_in'

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'adding a new allergy' do
    visit('/allergies/new')

    fill_in 'Name', with: 'John'
    fill_in 'Description', with: 'Protein diet'

    click_on 'Create Allergy'

    expect(page).to have_content 'John'
  end
end
