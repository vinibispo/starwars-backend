class CastsController < ApplicationController
  def create
    input = { film_id: cast_params[:film_id], people_id: cast_params[:character_id] }

    cast = Cast.new(input)
    if cast.save
      render json: cast, status: :created
    else
      render json: { errors: cast.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    cast = Cast.find_by(id: params[:id])
    if cast
      cast.destroy
      head :no_content
    else
      render json: { error: 'Cast not found' }, status: :not_found
    end
  end

  private

  def cast_params
    params.require(:cast).permit(:film_id, :character_id)
  end
end
