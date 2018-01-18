require "rails_helper"

describe ArticlesController do
  render_views

  let(:author) { create(:author_with_article) }
  let(:article) { author.articles.first }

  describe "index" do
    it 'renders the other template' do
      get :index
    end
  end

  describe 'show action' do
    context 'show concrete article' do
      it 'exist article' do
        get :show, params: { id: article.id }
      end

      it 'does not exist article' do
        expect { get :show,
          params: { id: -1 } }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

  describe 'create action' do
    context 'when valid' do
      render_views

      let(:new_values) { attributes_for(:article) }

      it "render article page" do
        # post :create, params: { article: new_values }
        # expect(response).to redirect_to (articles_path)
      end
    end
  end
end
