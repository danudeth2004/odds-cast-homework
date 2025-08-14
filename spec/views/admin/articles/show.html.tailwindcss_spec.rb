require 'rails_helper'

RSpec.describe "admin/articles/show", type: :view do
  before(:each) do
    assign(:admin_article, Admin::Article.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
