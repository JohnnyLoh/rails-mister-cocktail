class CocktailsController < ApplicationController
  before_action :set_cocktails, only: [:show, :destroy]

  def index         # GET /cocktails
    @cocktails = Cocktail.all
  end
  # --------------------

  def show          # GET /cocktails/:id
    # @review = Review.new
  end

  # --------------------
  def new           # GET /cocktails/new
    @cocktail = Cocktail.new
  end

  def create        # POST /cocktails
    @cocktail = Cocktail.new(cocktail_params)
    # raise
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
      # redirect_to cocktails_path
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

end
