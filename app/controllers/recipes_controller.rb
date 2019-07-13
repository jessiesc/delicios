# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :recipe, only: %i[show update destroy edit]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show; end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe),
                  flash: { notice: 'Recipe was successfully created' }
    else
      redirect_to new_recipe_path,
                  flash: { error: @recipe.errors.full_messages.to_sentence }
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe),
                  flash: { notice: 'Recipe updated' }
    else
      redirect_to edit_recipe_path(@recipe)
    end
  end

  def edit; end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, flash: { notice: 'Recipe deleted' }
  end

  private

  def recipe_params
    params.require(:recipe)
      .permit(:name, :description, :preparation_kind, :preparation_time,
              ingredients_attributes: %i[weight product_id])
  end

  def recipe
    @recipe = Recipe.find(params[:id])
  end
end
