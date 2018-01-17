class Admin::CategoriesController < ApplicationController

  def index
    @categories = Categories.order(id: :desc).all
  end

  def new
    @categories = Categories.new
  end

  def create
    @categories = Categories.new(category_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:categories).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end
end