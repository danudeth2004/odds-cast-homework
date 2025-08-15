require 'rails_helper'

describe 'Admin can destroy articles', type: :system do
  let!(:article) { create(:article) }

  context 'from index page' do
    it 'destroys an article' do
      login_as_admin
      visit admin_articles_path
      expect(page).to have_content('Sprint on Rails')

      accept_confirm do
        click_button 'Destroy', match: :first
      end

      expect(page).not_to have_content('Sprint on Rails')
    end
  end

  context 'from show page' do
    it 'destroys an article' do
      login_as_admin
      visit admin_article_path(article)

      accept_confirm do
        click_button 'Destroy this article'
      end

      expect(page).not_to have_content('Sprint on Rails')
    end
  end
end
