require "rails_helper"

describe ListReportsController do
  render_views
  describe "index" do
    it "renders the other template" do
      get :index
    end
  end

  describe 'show action' do
    context 'show file' do
      it 'exist file' do
        file = Rails.root + "db/importers/reports/report_test"
        f = File.open("#{file}.html", 'w')
        get :show, params: { id: file }
      end

      it 'does not exist file' do
        expect(File).not_to exist("file")
      end
    end
  end

  DatabaseCleaner.clean
end
