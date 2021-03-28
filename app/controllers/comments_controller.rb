class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create

    if Item.find(params[:item_id]).purchase
      redirect_to root_path
    else
      comment = Comment.new(comment_params)
      if comment.valid?
        comment.save
      end
      redirect_to item_path(comment_params[:item_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
