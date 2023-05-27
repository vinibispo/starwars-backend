# frozen_string_literal: true

class PlanetsController < ApplicationController
  include Pagy::Backend

  def index
    Planet::List
      .call(search: params[:q])
      .on_failure(:not_found) { render json: { error: 'Planet not found' }, status: :not_found }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
      .on_success do |result|
        pagy_object, planets = pagy(result[:planets])
        pagy_headers_merge(pagy_object)
        render json: planets.map(&Serialize)
      end
  end

  def show
    Planet::Find
      .call(id: params[:id])
      .on_success { |result| render json: Serialize.call(result[:planet]) }
      .on_failure(:not_found) { render json: { error: 'Planet not found' }, status: :not_found }
  end

  def create
    Planet::Add
      .call(input: planet_params)
      .on_success { |result| render json: Serialize.call(result[:planet]), status: :created }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
  end

  def update
    Planet::Update
      .call(id: params[:id], input: planet_params)
      .on_success { |result| render json: Serialize.call(result[:planet]) }
      .on_failure(:not_found) { render json: { error: 'Planet not found' }, status: :not_found }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
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

  Serialize = lambda do |planet|
    ::Planets::Serializer.new(
      id: planet.id,
      name: planet.name,
      diameter: planet.diameter,
      rotation_period: planet.rotation_period,
      orbital_period: planet.orbital_period,
      gravity: planet.gravity,
      population: planet.population,
      climate: planet.climate,
      terrain: planet.terrain,
      surface_water: planet.surface_water,
      created: planet.created,
      edited: planet.edited,
      residents: planet.residents,
      films: planet.films
    )
  end

  private_constant :Serialize
end
