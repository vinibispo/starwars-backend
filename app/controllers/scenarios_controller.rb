class ScenariosController < ApplicationController
  def create
    scenario = Film::Planet.new(scenario_params)
    if scenario.save
      render json: scenario, status: :created
    else
      render json: { errors: scenario.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def scenario_params
    params.require(:scenario).permit(:film_id, :planet_id)
  end
end
