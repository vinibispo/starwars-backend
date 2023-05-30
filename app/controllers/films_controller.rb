class FilmsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user

  def index
    Films::Repo::List
      .call(search: params[:q])
      .on_success do |result|
        pagy_object, films = pagy(result[:films])
        pagy_headers_merge(pagy_object)
        render json: films.map(&Serialize)
      end
  end

  def show
    Films::Repo::Find
      .call(id: params[:id])
      .on_success { |result| render json: Serialize.call(result[:film]) }
      .on_failure(:not_found) { render json: { error: 'Film not found' }, status: :not_found }
  end

  def create
    Films::Repo::Create
      .call(input: film_params)
      .on_success { |result| render json: result[:film], status: :created }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
  end

  def update
    Films::Repo::Update
      .call(id: params[:id], input: film_params)
      .on_success { |result| render json: Serialize.call(result[:film]) }
      .on_failure(:not_found) { render json: { error: 'Film not found' }, status: :not_found }
      .on_failure(:invalid) { |result| render json: { errors: result[:error] }, status: :unprocessable_entity }
  end

  def destroy
    Films::Repo::Remove
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

  Serialize = lambda do |film|
    Films::Serializer.new(
      id: film.id,
      title: film.title,
      episode_id: film.episode_id,
      opening_crawl: film.opening_crawl,
      director: film.director,
      producer: film.producer,
      release_date: film.release_date,
      characters: film.characters,
      planets: film.planets
    )
  end

  private_constant :Serialize
end
