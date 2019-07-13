# frozen_string_literal: true

require 'rails_helper'

feature 'removing a diet' do
  let!(:diet) { FactoryBot.create :diet }
  let!(:diet_name) { diet.name }
  let!(:user) { Administrator.create(email: 'john1@example.com', password: 'sEcReT321') }

  before do
    visit '/users/sign_in'

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'remove diet' do
    visit diet_path(diet)

    click_on 'Remove'

    expect(page).to have_no_content diet_name
  end
end
