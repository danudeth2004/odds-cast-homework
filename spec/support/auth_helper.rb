module AuthHelper
  def login_as_admin
    create(:user)
    visit admin_articles_path
    expect(page).to have_current_path(new_session_path)

    fill_in 'Enter your email address', with: 'oat@oat.com'
    fill_in 'Enter your password', with: '1'
    click_button 'Sign in'

    expect(page).to have_current_path(admin_articles_path)
    expect(page).to have_content('Article')
  end
end

RSpec.configure do |config|
  config.include AuthHelper, type: :system
end
