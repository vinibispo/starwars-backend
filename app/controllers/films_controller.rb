class FilmsController < ApplicationController
  include Pagy::Backend

  def index
    Film::List
      .call(search: params[:q])
      .on_success do |result|
        pagy_object, films = pagy(result[:films])
        pagy_headers_merge(pagy_object)
        render json: films
      end
  end

  def show
    Film::Find
      .call(id: params[:id])
      .on_success { |result| render json: result[:film] }
      .on_failure(:not_found) { render json: { error: 'Film not found' }, status: :not_found }
  end

  def create
    Film::Create
      .call(input: film_params)
      .on_success { |result| render json: result[:film], status: :created }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
  end

  def update
    Film::Update
      .call(id: params[:id], input: film_params)
      .on_success { |result| render json: result[:film] }
      .on_failure(:not_found) { render json: { error: 'Film not found' }, status: :not_found }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
  end

  def destroy
    Film::Remove
      .call(id: params[:id])
      .on_success { head :no_content }
      .on_failure(:not_found) { render json: { error: 'Film not found' }, status: :not_found }
  end

  private

  def film_params
    params.require(:film).permit(
      :title,
      :episode_id,
      :opening_crawl,
      :director,
      :producer,
      :release_date
    )
  end
end
