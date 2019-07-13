# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :product, only: %i[show update destroy edit]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show; end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product),
                  flash: { notice: 'Product was successfully created.' }
    else
      redirect_to new_recipe_path,
                  flash: { error: @product.errors.full_messages.to_sentence }
    end
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to product_path(@product),
                  flash: { notice: 'Product updated' }
    else
      render redirect_to edit_product_path(@product)
    end
  end

  def edit; end

  def destroy
    @product.destroy
    redirect_to products_path, flash: { notice: 'Product deleted' }
  end

  private

  def product_params
    params.require(:product)
      .permit(:name, :category, :kal)
  end

  def product
    @product = Product.find(params[:id])
  end
end
