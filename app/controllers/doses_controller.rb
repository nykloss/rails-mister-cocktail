class DosesController < ApplicationController
  before_action :set_cocktail, only: [:index, :new, :create, :destroy]

  def index
    @doses = Dose.all
  end

  # def show
  # end

  # def new
  #   @dose = Dose.new
  # end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # def set_ingredient
  #   @ingredient = Ingredient.find(params[:ingredient_id])
  # end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
