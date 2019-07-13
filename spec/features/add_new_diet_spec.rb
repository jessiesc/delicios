# frozen_string_literal: true

require 'rails_helper'

feature 'creating a new diet' do
  let!(:user) { Administrator.create(email: 'john1@example.com', password: 'sEcReT321') }

  before do
    visit '/users/sign_in'

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'adding a new diet' do
    visit('/diets/new')

    fill_in 'Name', with: 'Billy'
    fill_in 'Description', with: 'Apple diet'

    click_on 'Create Diet'

    expect(page).to have_content 'Billy'
  end
end
