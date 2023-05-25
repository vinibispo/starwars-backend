# frozen_string_literal: true

class PeopleController < ApplicationController
  include Pagy::Backend
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    if params[:q].present?
      @pagy, people = pagy(Person.ransack(name_cont: params[:q]).result(distinct: true))
    else
      @pagy, people = pagy(Person.all)
    end
    render json: people
  end

  def show
    person = Person.find_by(id: params[:id])
    if person
      render json: person
    else
      render json: { error: 'Person not found' }, status: :not_found
    end
  end

  def create
    person = Person.new(person_params)
    if person.save
      render json: person, status: :created
    else
      render json: { errors: person.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    person = Person.find_by(id: params[:id])
    if person
      if person.update(person_params)
        render json: person
      else
        render json: { errors: person.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Person not found' }, status: :not_found
    end
  end

  private

  def person_params
    params.require(:person).permit(
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
