class PagesController < ApplicationController
  def home
    @categories = Category.all
  end
  def erb_demo
  end
end
