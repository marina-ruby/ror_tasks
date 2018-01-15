require "rails_helper"

describe TagsController do
  render_views

  describe "index" do
    it "renders the other template" do
      get :index
    end
  end
end
