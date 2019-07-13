# frozen_string_literal: true

require 'rails_helper'

feature 'Creating flow by Admin: ' do
  let!(:user)      { Administrator.create(email: 'john1@example.com', password: 'sEcReT321') }
  let!(:topic)     { FactoryBot.create(:topic) }
  let!(:article)   { FactoryBot.create(:article, user_id: user.id, topic_id: topic.id) }
  let!(:article_2) { FactoryBot.attributes_for(:article) }

  before do
    visit '/users/sign_in'

    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end

    click_button 'Log in'
  end

  scenario 'Admin creates article' do
    visit new_article_path

    fill_in 'Title', with: article.title
    find('trix-editor').click.set('Text')

    click_button 'Create Article'
    expect(page).to have_current_path('/articles')

    visit '/articles'
    expect(page).to have_content article.title
  end

  scenario 'Admin edits an article' do
    visit article_path(article)

    click_on 'Edit'

    fill_in 'Title', with: article_2[:title]

    click_button 'Update Article'

    visit article_path(article)
    expect(page).to have_content article_2[:title]
  end
end
