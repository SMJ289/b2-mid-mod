class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:park_id])
  end

  private
  def park_params
    params.permit(:name, :admission_price)
  end
end
