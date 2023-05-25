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
end
