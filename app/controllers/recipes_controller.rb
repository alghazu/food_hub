class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_recipe, only: [:show, :edit, :update]
  before_action :authorize_record, only: [:edit, :update]
  before_action :load_categories, except: [:show]

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
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "You have successfully edit recipe!"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Error updating recipe!"
      render :edit
    end
  end

private

 def recipe_params
   recipe = params.require(:recipe).permit(:title, :description, :ingredients, :directions, :category_id )
   recipe[:user] = current_user
   recipe
 end

 def get_recipe
    @recipe = Recipe.find(params[:id])
 end

 def authorize_record
    authorize @recipe
 end

def load_categories
  @categories = Category.all
end

end
