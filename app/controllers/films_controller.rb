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
end
