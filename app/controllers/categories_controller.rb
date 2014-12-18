class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    index
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def new
    index
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    index
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to(:action => 'show', :id => @category.id)
    else
      render('index')
    end
  end

  def delete
    index
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private

  def category_params
    params.require(:category).permit(:name, :thumburl)
  end

end
