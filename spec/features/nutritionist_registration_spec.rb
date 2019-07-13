# frozen_string_literal: true

require 'rails_helper'

feature 'Registrating Nutritionist: ' do
  let(:user) { Nutritionist.new(email: 'john1@example.com', password: 'sEcReT321') }

  before do
    visit '/users/sign_in'
    click_on 'Sign up as nutritionist'
  end

  scenario 'User registers as nutritionist' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Register'

    expect(page).to have_content 'All articles'
  end

  scenario 'User does not fill in email' do
    expect(page).to have_content 'Register as Nutritionist'

    fill_in 'Password', with: user.password

    click_button 'Register'

    expect(page).to have_content "Email can't be blank"
  end

  scenario 'User does not fill in password' do
    expect(page).to have_content 'Register as Nutritionist'

    fill_in 'Email', with: user.email

    click_button 'Register'

    expect(page).to have_content "Password can't be blank"
  end
end
