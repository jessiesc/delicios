# frozen_string_literal: true

require 'rails_helper'

feature 'Creating flow by Client' do
  let!(:user) { Client.new(email: 'john1@example.com', password: 'sEcReT321') }

  scenario 'Client registrates profile' do
    visit new_user_registration_path(role: :client)

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Register'

    expect(page).to have_current_path root_path
  end

  scenario 'Client validation of registration' do
    visit new_user_registration_path(role: :client)

    fill_in 'Email', with: user.email

    click_button 'Register'

    expect(page).to have_content "Password can't be blank"
  end

  scenario 'Client validation of registration' do
    visit new_user_registration_path(role: :client)

    fill_in 'Password', with: user.password

    click_button 'Register'

    expect(page).to have_content "Email can't be blank"
  end
end
