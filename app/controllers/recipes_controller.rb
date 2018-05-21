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

  def fork
    recipe_id = params[:recipe_id]
    current_recipe = Recipe.find(recipe_id)
    if current_user.recipes.collect(&:fork_recipe).flatten.include?(recipe_id)
      refresh_page
      flash[:alert] = "You have already forked this recipe"
    elsif current_recipe.user == current_user
      refresh_page
      flash[:alert]= "You can not fork your own recipe! Edit it instead"
    elsif current_recipe.fork_user.include?(current_user.id.to_s)
      refresh_page
      flash[:alert]= "You can not fork a recipe that was forked from you"
    else
      @recipe = current_recipe.dup
      @recipe.title = current_user.name + "\'s " + current_recipe.title
      @recipe.user = current_user
      @recipe.fork_user << current_recipe.user.id
      @recipe.fork_recipe << current_recipe.id
      @recipe.save
      redirect_to edit_recipe_path(@recipe.id)
      flash[:notice] = "Recipe Sucessfully Forked"
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

  def refresh_page
    redirect_to request.referrer
  end

end
