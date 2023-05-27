class ScenariosController < ApplicationController
  def create
    scenario = Scenario.new(scenario_params)
    if scenario.save
      render json: scenario, status: :created
    else
      render json: { errors: scenario.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    scenario = Scenario.find_by(id: params[:id])
    if scenario
      scenario.destroy
      head :no_content
    else
      render json: { error: 'Scenario not found' }, status: :not_found
    end
  end

  private

  def scenario_params
    params.require(:scenario).permit(:film_id, :planet_id)
  end
end
