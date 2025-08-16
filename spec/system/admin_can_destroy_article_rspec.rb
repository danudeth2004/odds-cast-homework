require 'rails_helper'

describe 'Admin can destroy articles', type: :system do
  let!(:article) { create(:article) }

  context 'from show page' do
    it 'destroys an article' do
      login_as_admin
      visit admin_article_path(article)

      accept_confirm do
        click_button 'Delete'
      end

      expect(page).not_to have_content('Sprint on Rails')
    end
  end
end
