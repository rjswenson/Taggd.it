class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(@comment.user_id)
  end

  def index
    @comments = Comment.order('created_at DESC')
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def update
  end

  def destroy
    @image = Image.find(@comment.image_id)
    @comment.destroy
    flash[:notice] = "Comment Destroyed."
    redirect_to @image
  end

  def create
    @comment = Comment.new(comment_params)
    @image = Image.find(@comment.image_id)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @image,
                    notice: 'Comment created!'}
        format.json { render json: @image,
                    notice: 'Comment created!'}
      else
        format.html { render @image }
        format.json { render json: @comment.errors }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body,
                  :user_id, :image_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
