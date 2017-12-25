class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      model = Article.joins(:tags).where(tags: { name: params[:tag] })
    else
      model = Article
    end
    @articles = model.paginate(page: params[:page], per_page: 10)
                     .order('created_at DESC')
  end

  def show
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
end
