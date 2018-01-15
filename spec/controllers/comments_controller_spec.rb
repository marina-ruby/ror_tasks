require "rails_helper"

describe CommentsController do
  render_views

  describe "create action" do

    it "render article page" do
      author = create(:author_with_article)
      article = author.articles.first
      # post :create, params: { comment: { user_name: "user", text: "abc"} }
    end

  end
end
