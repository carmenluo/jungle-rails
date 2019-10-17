class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(created_at: :desc)
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.find_or_create_by! name: params["category"]["name"]
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end
  def edit
    @category = Category.find(params[:id])
  end
end
