class RemoteController < ApplicationController

  def index
    @remotes = Remote.all
    get_describe
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
      # render 'new'
    end
  end


  private
  def article_params
    params.require(:remote).permit(:body)
  end

  def get_describe
    case @remotes.count.to_s
    when /^1$/ then @describe = 'запрос'
    when /^1|[5-9]$|0$/ then @describe = 'запросов'
    when /1$/ then @describe = 'запрос'
    when /[2-4]$/ then @describe = 'запроса'
    else
      @describe = 'Errors'
    end
  end
end
