require "rails_helper"

describe CommentsController do
  render_views

  let(:author) { create(:author_with_article) }
  let(:article) { author.articles.first }
  let(:comments) { author.articles.comments }
  let(:comment) { author.articles.comments.first }

  describe "index action" do
    it 'render a list of comments' do
      get :index
      # expect(assigns(:comments)).to match_array(@comments)
    end
  end

  describe 'create action' do
    context 'when valid' do
      render_views

      let(:new_values) { attributes_for(:comment) }

      it "render article page" do
        post :create,
          params: { article_id: article.id, comment: new_values }
        expect(response).to redirect_to (article_path(article.id))
      end
    end
  end
end
