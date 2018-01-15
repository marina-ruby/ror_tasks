require "rails_helper"
require 'spec_helper'

describe AuthorsController do
  render_views
  describe "GET index" do
    it 'render a list of authors' do
      author1, author2 = create(:author), create(:author)
      get :index
      expect(assigns(:authors)).to match_array([author1, author2])
    end
  end

  describe 'show action' do
    it 'should list of articles' do
      author = create(:author)
      get :show, params: { id: author.id }
      expect(response).to render_template :show
    end

    # it 'renders 404 page' do
    #   get :show, params: { id: 0 }
    #   response.status.should == 404
    # end
  end
end
