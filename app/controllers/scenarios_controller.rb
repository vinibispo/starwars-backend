class ScenariosController < ApplicationController
  before_action :authenticate_user
  def create
    Scenarios::Repo::Create
      .call(film_id: scenario_params[:film_id], planet_id: scenario_params[:planet_id])
      .on_success { |result| render json: Serialize.call(result[:scenario]), status: :created }
      .on_failure(:invalid) { |result| render json: { errors: result[:errors] }, status: :unprocessable_entity }
  end

  def destroy
    Scenarios::Repo::Remove
      .call(id: params[:id])
      .on_success { head :no_content }
      .on_failure(:not_found) { render json: { error: 'Scenario not found' }, status: :not_found }
  end

  private

  def scenario_params
    params.require(:scenario).permit(:film_id, :planet_id)
  end

  Serialize = lambda do |scenario|
    Scenarios::Serializer.new(
      id: scenario.id,
      film_id: scenario.film_id,
      planet_id: scenario.planet_id,
      film: scenario.film,
      planet: scenario.planet
    )
  end

  private_constant :Serialize
end
