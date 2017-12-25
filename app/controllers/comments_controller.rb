class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
end
