# frozen_string_literal: true

class AllergiesController < ApplicationController
  before_action :current_allergy, only: %i[show edit update destroy]

  def index
    @allergies = Allergy.all
  end

  def show; end

  def new
    @allergy = Allergy.new
  end

  def create
    @allergy = Allergy.new(allergy_params)
    if @allergy.save
      redirect_to allergy_path(@allergy)
    else
      redirect_to allergies_path
    end
  end

  def edit; end

  def update
    @allergy.update(allergy_params)

    redirect_to allergy_path(@allergy)
  end

  def destroy
    @allergy.destroy

    redirect_to allergies_path
  end

  private

  def allergy_params
    params.require(:allergy).permit(:name, :description)
  end

  def current_allergy
    @allergy = Allergy.find(params[:id])
  end
end
