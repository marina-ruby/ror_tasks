class RemoteController < ApplicationController

  def index
    @remotes = Remote.all
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
    else
      render 'new'
    end
  end

  def article_params
    params.require(:remote).permit(:body)
  end
end
