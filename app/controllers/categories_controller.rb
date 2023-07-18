class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(categories_params)

    if @category.save
      redirect_to categories_path, notice: 'Category created successfully'
    else
      render :new, alert: 'Failed to create payment.'
    end
  end

  private

  def categories_params
    params.require(:category).permit(:name, :icon)
  end
end
