class DosesController < ApplicationController
  def new           # GET /cocktails/new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def index
    @doses = Dose.all
  end

  def create        # POST /cocktails
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_doses_path
    else
      render :new
    end
  end

   def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to dose_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :incredient_id)
  end
end
