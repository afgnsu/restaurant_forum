class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_category, except: [:index]

  def index
    @categories = Category.all

    if params[:id]

    else
      @category = Category.new
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash.notice = "Category was successfully created!"
      redirect_to admin_categories_path        
    else
      flash.alert = "#{ @category.errors.full_messages.to_sentence }"
      @categories = Category.all
      render :index
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash.notice = "Category was successfully updated"
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    @category.destroy
    flash.alert = "Category was successfully deleted"
    redirect_to admin_categories_path
  end


  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
