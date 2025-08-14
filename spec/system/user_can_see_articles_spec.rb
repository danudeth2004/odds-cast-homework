require 'rails_helper'

describe 'Admin can see article' do
  context 'an article exists' do
    before do
      create(:article)
    end
    it "display articles on page" do
      visit root_path
      expect(page).to have_content('Sprint on Rails')
    end
  end
end
