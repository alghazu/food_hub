class CategoriesController < ApplicationController
  def show
    @recipes = Category.find_by(id: params[:id]).recipes
    render 'recipes/index'
  end
end
