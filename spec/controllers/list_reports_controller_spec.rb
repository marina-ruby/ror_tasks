require "rails_helper"

describe ListReportsController do
  render_views
  describe "index" do
    it "renders the other template" do
      get :index
    end
  end

  describe 'show action' do
    subject { assigns('file') }
    it 'should show report' do
      get :show, params: { id: "report_name" }
      # expect(response).to render_template :show
    end
  end
  DatabaseCleaner.clean
end
