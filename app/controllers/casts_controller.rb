class CastsController < ApplicationController
  def create
    Casts::Repo::Add
      .call(film_id: cast_params[:film_id], character_id: cast_params[:character_id])
      .on_success { |result| render json: Serialize.call(result[:cast]), status: :created }
      .on_failure(:invalid) { |result| render json: { errors: result[:errors] }, status: :unprocessable_entity }
  end

  def destroy
    Casts::Repo::Remove
      .call(id: params[:id])
      .on_success { head :no_content }
      .on_failure(:not_found) { render json: { error: 'Cast not found' }, status: :not_found }
  end

  private

  def cast_params
    params.require(:cast).permit(:film_id, :character_id)
  end

  Serialize = lambda do |cast|
    Casts::Serializer.new(
      id: cast.id,
      film_id: cast.film_id,
      character_id: cast.people_id,
      character: cast.character,
      film: cast.film
    )
  end

  private_constant :Serialize
end
