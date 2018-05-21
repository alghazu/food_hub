class LikesController < ApplicationController
  before_action :authenticate_user!

  def upvote
      Like.create(recipe_id: recipe_id, user_id: current_user.id)
      redirect_to request.referrer
  end

  def downvote
    Like.where(recipe_id: recipe_id, user_id: current_user.id).destroy_all
    redirect_to request.referrer
  end

  private
  def recipe_id
    params[:recipe_id]
  end

end
