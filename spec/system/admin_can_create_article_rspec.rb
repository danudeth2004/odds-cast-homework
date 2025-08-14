require 'rails_helper'

describe 'Admin can create article', type: :system do
  it 'allows admin to create an article as draft' do
    visit new_admin_article_path

    fill_in 'Title', with: 'Sprint on Rails'
    fill_in 'Description', with: 'P Mac geng mak'

    click_button 'Save draft'

    expect(page).to have_content('Sprint on Rail')
    expect(page).to have_content('draft'.humanize)
  end

  it 'allows admin to submit article for review' do
    login_as_admin
    visit new_admin_article_path

    fill_in 'Title', with: 'Sprint on Rails'
    fill_in 'Description', with: 'P Mac geng mak'

    click_button 'Submit for Review'

    expect(page).to have_content('Sprint on Rail')
    expect(page).to have_content('waiting_for_review'.humanize)
  end
end
