class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe Sucessfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if current_user != @recipe.user
      flash[:alert] = 'You can only edit the recipes you created'
      redirect_to root_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user != @recipe.user
      flash[:alert] = 'You can only delete the recipes you created'
    else
      @recipe.destroy
    end
    redirect_to root_path
  end

  private

  def recipe_params
   recipe = params.require(:recipe).permit(:title, :description, :ingredients, :directions, :category_id)
   recipe[:user] = current_user
   recipe
  end
end
