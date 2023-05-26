# frozen_string_literal: true

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

  def create
    planet = Planet.new(planet_params)
    if planet.save
      render json: planet, status: :created
    else
      render json: { errors: planet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    planet = Planet.find_by(id: params[:id])
    if planet
      if planet.update(planet_params)
        render json: planet
      else
        render json: { errors: planet.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Planet not found' }, status: :not_found
    end
  end

  def destroy
    Planet::Remove
      .call(id: params[:id])
      .on_success { head :no_content }
      .on_failure(:not_found) { render json: { error: 'Planet not found' }, status: :not_found }
  end

  private

  def planet_params
    params.require(:planet).permit(
      :name,
      :diameter,
      :rotation_period,
      :orbital_period,
      :gravity,
      :population,
      :climate,
      :terrain,
      :surface_water
    )
  end
end
