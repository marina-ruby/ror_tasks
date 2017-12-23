class RemoteController < ApplicationController

  def index
    @remotes = Remote.all
    @describe = Russian.p(@remotes.count, 'запрос', 'запроса', 'запросов')
  end

  def show
    @remote = Remote.find(params[:id])
  end

  def new
    @remote = Remote.new
  end

  def edit
    @remote = Remote.find(params[:id])
  end

  def create
    @remote = Remote.new(article_params)
    if @remote.save
      redirect_to remote_index_path
    end
  end

  private
  def article_params
    params.require(:remote).permit(:body)
  end
end
