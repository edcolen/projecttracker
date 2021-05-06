class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.card = Card.find(params[:card_id])
    authorize @comment.project, :membership_check
    if @comment.save
      redirect_to @comment.card, notice: 'Comment successfully created.'
    else
      redirect_to @card
    end
  end

  def edit
    authorize @comment
  end

  def update
    authorize @comment
    if @comment.update(card_params)
      redirect_to @comment.card, notice: 'Comment successfully edited.'
    else
      render :edit
    end
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    redirect_to card_path(@comment.card), notice: 'Comment not found.' if @comment.nil?
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
