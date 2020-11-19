class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktails.all
  end

  def show
    @cocktails = Cocktail.find(params[:id])
  end

  def new
    def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  end


end

