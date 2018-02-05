require "rails_helper"
require 'spec_helper'

describe AuthorsController do

  render_views

  describe "index action" do
    it 'render a list of authors' do
      authors = create_list(:author, 5)
      get :index
      expect(assigns(:authors)).to match_array(authors)
    end
  end

  describe 'show action' do
    it 'show list of articles' do
      author = create(:author)
      get :show, params: { id: author.id }
      expect(response).to render_template :show
    end

    it 'does not show list of articles' do
      expect { get :show,
          params: { id: -1 } }.to raise_exception ActiveRecord::RecordNotFound
    end
  end

  describe 'update action' do
    let(:author) { create(:author) }
    let(:new_values) { attributes_for(:author) }

    context 'when valid' do
      render_views

      it "render article page" do
        put :update,
          params: { id: author.id, name: author.name, author: new_values }
        expect(response).to redirect_to(articles_path)
      end
    end

    context 'when invalid' do
      it "render edit page" do
        put :update,
          params: { id: author.id, author: { name: "-0"} }
        expect(response).to render_template :edit
      end
    end

    context 'edit action' do
      it 'renders users form' do
        get :edit, params: { id: author.id }
        expect(response).not_to redirect_to(edit_author_path(author.id))
      end
    end
  end
end
