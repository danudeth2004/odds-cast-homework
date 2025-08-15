require 'rails_helper'

describe 'Admin can see article' do
  context 'an article exists' do
    before do
      create(:article)
      create(:article, :waiting_for_review)
    end
    it "display articles on page" do
      visit root_path
      expect(page).not_to have_content('Review Title')
      expect(page).to have_content('Sprint on Rails')
    end
  end
end
