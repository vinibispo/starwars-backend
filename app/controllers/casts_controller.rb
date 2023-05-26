class CastsController < ApplicationController
  def create
    input = { film_id: cast_params[:film_id], people_id: cast_params[:person_id] }

    cast = Film::Person.new(input)
    if cast.save
      render json: cast
    else
      render json: { errors: cast.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def cast_params
    params.require(:cast).permit(:film_id, :person_id)
  end
end
