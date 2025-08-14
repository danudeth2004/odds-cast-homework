require 'rails_helper'

describe 'User can see article' do
  context 'an article exists' do
    before do
      create(:article)
      create(:article, :draft)
      create(:article, :waiting_for_review)
      create(:article, :published)
    end
    it "display articles on page" do
      login_as_admin
      visit admin_articles_path
      expect(page).to have_content('Sprint on Rails')
      expect(page).to have_content('Draft Title')
      expect(page).to have_content('Review Title')
      expect(page).to have_content('Published Title')
    end
  end
end
