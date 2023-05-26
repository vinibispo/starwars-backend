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
        render json: planets
      end
  end

  def show
    Planet::Find
      .call(id: params[:id])
      .on_success { |result| render json: result[:planet] }
      .on_failure(:not_found) { render json: { error: 'Planet not found' }, status: :not_found }
  end

  def create
    Planet::Add
      .call(input: planet_params)
      .on_success { |result| render json: result[:planet], status: :created }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
  end

  def update
    Planet::Update
      .call(id: params[:id], input: planet_params)
      .on_success { |result| render json: result[:planet] }
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
end
