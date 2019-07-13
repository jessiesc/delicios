# frozen_string_literal: true

class DietsController < ApplicationController
  before_action :current_diet, only: %i[show edit update destroy]

  def index
    @diets = Diet.all
  end

  def show; end

  def new
    @diet = Diet.new
  end

  def create
    @diet = Diet.new(diet_params)
    if @diet.save
      redirect_to diet_path(@diet)
    else
      redirect_to diet_path
    end
  end

  def edit; end

  def update
    @diet.update(diet_params)

    redirect_to diet_path(@diet)
  end

  def destroy
    @diet.destroy

    redirect_to diets_path
  end

  private

  def diet_params
    params.require(:diet).permit(:name, :description)
  end

  def current_diet
    @diet = Diet.find(params[:id])
  end
end
