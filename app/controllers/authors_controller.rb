class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.paginate(page: params[:page], per_page: 10)
  end

  def show
    @articles =
      @author
      .articles
      .includes(:tags)
      .order('created_at DESC')
  end

  def edit
    @user = Author.find(params[:id])
  end

  def update
    @user = Author.find(params[:id])

    if @user.update(author_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
