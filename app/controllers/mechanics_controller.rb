class MechanicsController < ApplicationController
  def new

  end

  def create
    Mechanic.new(mechanic_params)
  end

  def index
    @mechanics = Mechanic.all
  end

  private
  def mechanic_params
    params.permit(:name, :years_experience)
  end
end
