# frozen_string_literal: true

class PeopleController < ApplicationController
  include Pagy::Backend
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    if params[:q].present?
      @pagy, people = pagy(Character.ransack(name_cont: params[:q]).result(distinct: true))
    else
      @pagy, people = pagy(Character.all)
    end
    render json: people
  end

  def show
    character = Character.find_by(id: params[:id])
    if character
      render json: character
    else
      render json: { error: 'Character not found' }, status: :not_found
    end
  end

  def create
    character = Character.new(character_params)
    if character.save
      render json: character, status: :created
    else
      render json: { errors: character.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    Character::Update
      .call(id: params[:id], input: character_params)
      .on_success { |result| render json: result[:character] }
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
end
