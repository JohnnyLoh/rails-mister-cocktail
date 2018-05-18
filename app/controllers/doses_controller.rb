class DosesController < ApplicationController
  def new           # GET /cocktails/new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def index
    @doses = Dose.all
  end

  def create        # POST /cocktails
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

   def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  #other way: define destroy nested (in routes.rb)
  #link_to needs two parameters: cocktail_dose_path(@cocktail, @dose), (in show.html.erb)

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

