class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end
end
