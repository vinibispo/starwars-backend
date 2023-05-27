class FilmsController < ApplicationController
  include Pagy::Backend
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    if params[:q].present?
      @pagy, films = pagy(Film.ransack(title_cont: params[:q]).result(distinct: true))
    else
      @pagy, films = pagy(Film.all)
    end
    render json: films
  end

  def show
    film = Film.find_by(id: params[:id])
    if film
      render json: film
    else
      render json: { error: 'Film not found' }, status: :not_found
    end
  end

  def create
    film = Film.new(film_params)
    if film.save
      render json: film, status: :created
    else
      render json: { errors: film.errors.full_messages }, status: :unprocessable_entity
    end
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
