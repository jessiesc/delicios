# frozen_string_literal: true

require 'rails_helper'

feature 'Creating flow by Nutritionist: ' do
  let!(:user) { Nutritionist.create(email: 'john1@example.com', password: 'sEcReT321') }

  let!(:topic) { FactoryBot.build(:topic) }

  let!(:article) do
    Article.create(title: 'first article',
      content: 'The weather today is way too hot...', user_id: user.id, topic: topic)
  end

  let!(:article_2) do
    Article.new(title: 'updated article',
      content: 'Updated content...', user_id: user.id, topic: topic)
  end

  before do
    visit '/users/sign_in'

    within('#new_user') do
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
    end

    click_button 'Log in'
  end

  scenario 'Nutritionist creates article' do
    expect(page).to have_content 'Add a New article'

    click_on 'Add a New article'
    expect(page).to have_selector('h3', text: 'Create an Article')

    fill_in 'Title', with: article.title
    find('trix-editor').click.set('Text')

    click_button 'Create Article'
    expect(page).to have_current_path('/articles')

    visit '/articles'
    expect(page).to have_content 'first article'
  end

  scenario 'Nutritionist edits an article' do
    expect(page).to have_content 'first article'

    click_on 'first article'

    click_on 'Edit'

    fill_in 'Title', with: article_2.title
    find('trix-editor').click.set('Text')

    click_button 'Update Article'

    visit "/articles/#{article.id}"
    expect(page).not_to have_content 'first article'
  end
end
