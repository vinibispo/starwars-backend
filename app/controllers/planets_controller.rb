class PlanetsController < ApplicationController
  include Pagy::Backend
  after_action { pagy_headers_merge(@pagy) if @pagy }
  def index
    if params[:q].present?
      @pagy, planets = pagy(Planet.ransack(name_cont: params[:q]).result(distinct: true))
    else
      @pagy, planets = pagy(Planet.all)
    end
    render json: planets
  end

  def show
    planet = Planet.find_by(id: params[:id])
    if planet
      render json: planet
    else
      render json: { error: 'Planet not found' }, status: :not_found
    end
  end
end
