require 'rails_helper'

describe 'Admin can updates articles', type: :system do
  let!(:draft_article) { create(:article, :draft) }
  let!(:review_article) { create(:article, :waiting_for_review) }
  let!(:published_article) { create(:article, :published) }

  context 'draft article' do
    it 'saves changes without changing status' do
      login_as_admin
      visit edit_admin_article_path(draft_article)

      fill_in 'Title', with: 'Updated Draft Title'
      fill_in 'Description', with: 'Updated Draft description'
      click_button 'Save draft'

      draft_article.reload
      expect(page).to have_content('Updated Draft Title')
      expect(page).to have_content('draft'.humanize)
    end

    it 'submits draft for review' do
      login_as_admin
      visit edit_admin_article_path(draft_article)
      click_button 'Review'

      draft_article.reload
      expect(page).to have_content('waiting_for_review'.humanize)
    end
  end

  context 'article waiting for review' do
    it 'approves the article (publish)' do
      login_as_admin
      visit edit_admin_article_path(review_article)
      click_button 'Publish'

      review_article.reload
      expect(page).to have_content('published'.humanize)
    end

    it 'rejects the article back to draft' do
      login_as_admin
      visit edit_admin_article_path(review_article)
      click_button 'Reject'

      review_article.reload
      expect(page).to have_content('draft'.humanize)
    end
  end

  context 'published article' do
    it 'sends article back to draft' do
      login_as_admin
      visit edit_admin_article_path(published_article)
      click_button 'Back to Draft'

      published_article.reload
      expect(page).to have_content('draft'.humanize)
    end
  end
end
