class ListReportsController < ApplicationController
  def index
    @reports = Dir.glob('db/importers/reports/**.html')
  end

  def show
    @file = render_to_body file: Dir.glob("#{params[:id]}.html").first
  end
end
