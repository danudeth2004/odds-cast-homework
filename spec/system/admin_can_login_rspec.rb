require 'rails_helper'

describe 'Admin can login' do
  context 'an admin user exists' do
    before do
      create(:user)
    end
    it 'allows admin to login' do
      visit admin_articles_path
      expect(page).to have_current_path(new_session_path)
      fill_in 'Enter your email address', with: 'oat@oat.com'
      fill_in 'Enter your password', with: '1'
      click_button 'Sign in'

      expect(page).to have_current_path(admin_articles_path)
      expect(page).to have_content('Article')
    end
  end
end
