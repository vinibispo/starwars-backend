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
    Scenario::Remove
      .call(id: params[:id])
      .on_success { head :no_content }
      .on_failure(:not_found) { render json: { error: 'Scenario not found' }, status: :not_found }
  end

  private

  def scenario_params
    params.require(:scenario).permit(:film_id, :planet_id)
  end
end
