require 'rails_helper'

RSpec.describe "admin/articles/index", type: :view do
  before(:each) do
    assign(:admin_articles, [
      Admin::Article.create!(),
      Admin::Article.create!()
    ])
  end

  it "renders a list of admin/articles" do
    render
    cell_selector = 'div>p'
  end
end
