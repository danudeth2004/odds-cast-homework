require 'rails_helper'

RSpec.describe "admin/articles/edit", type: :view do
  let(:admin_article) {
    Admin::Article.create!()
  }

  before(:each) do
    assign(:admin_article, admin_article)
  end

  it "renders the edit admin_article form" do
    render

    assert_select "form[action=?][method=?]", admin_article_path(admin_article), "post" do
    end
  end
end
