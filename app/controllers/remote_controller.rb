class RemoteController < ApplicationController

  def index
    @remotes = Remote.all
    @count = @remotes.count
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
    @remote = Remote.create(article_params)
    render json: {
      body: @remote.body,
      date: @remote.created_at.strftime('%F %T %z')
    }
  end

  private
  def article_params
    params.require(:remote).permit(:body)
  end
end
