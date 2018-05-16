class LikesController < ApplicationController
  before_action :authenticate_user!
  def toggle
    recipe_id = params[:recipe_id]
    likes = Like.where(recipe_id: recipe_id)
    if likes.collect(&:user_id).exclude?(current_user.id)
      Like.create(recipe_id: recipe_id, user_id: current_user.id)
    else
      likes.where(user_id: current_user.id).destroy_all
    end
    redirect_to request.referrer
  end
end
