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
    film = Film.find_by(id: params[:id])
    if film.present?
      if film.update(film_params)
        render json: film
      else
        render json: { errors: film.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Film not found' }, status: :not_found
    end
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