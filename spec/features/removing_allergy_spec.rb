# frozen_string_literal: true

require 'rails_helper'

feature 'removing a allergy' do
  let!(:allergy) { FactoryBot.create :allergy }
  let!(:allergy_name) { allergy.name }
  let!(:user) { Administrator.create(email: 'john1@example.com', password: 'sEcReT321') }

  before do
    visit '/users/sign_in'

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  scenario 'remove allergy' do
    visit allergy_path(allergy)

    click_on 'Remove'

    expect(page).to have_no_content allergy_name
  end
end
