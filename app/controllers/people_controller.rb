# frozen_string_literal: true

class PeopleController < ApplicationController
  include Pagy::Backend

  def index
    Character::List
      .call(search: params[:q])
      .on_success do |result|
        pagy_object, characters = pagy(result[:characters])
        pagy_headers_merge(pagy_object)
        render json: characters.map(&Serialize)
      end
  end

  def show
    Character::Find
      .call(id: params[:id])
      .on_success { |result| render json: Serialize.call(result[:character]) }
      .on_failure(:not_found) { render json: { error: 'Character not found' }, status: :not_found }
  end

  def create
    Character::Create
      .call(input: character_params)
      .on_success { |result| render json: Serialize.call(result[:character]), status: :created }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
  end

  def update
    Character::Update
      .call(id: params[:id], input: character_params)
      .on_success { |result| render json: Serialize.call(result[:character]) }
      .on_failure(:not_found) { render json: { error: 'Character not found' }, status: :not_found }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
  end

  def destroy
    Character::Remove
      .call(id: params[:id])
      .on_success { head :no_content }
      .on_failure(:not_found) { render json: { error: 'Character not found' }, status: :not_found }
  end

  private

  def character_params
    params.require(:character).permit(
      :name,
      :birth_year,
      :eye_color,
      :gender,
      :hair_color,
      :height,
      :mass,
      :skin_color,
      :homeworld
    )
  end


  Serialize = lambda do |character|
    People::Serializer.new(
      id: character.id,
      name: character.name,
      birth_year: character.birth_year,
      eye_color: character.eye_color,
      gender: character.gender,
      hair_color: character.hair_color,
      height: character.height,
      mass: character.mass,
      skin_color: character.skin_color,
      homeworld: character.homeworld,
      films: character.films,
      planet: character.planet
    )
  end


  private_constant :Serialize
end
