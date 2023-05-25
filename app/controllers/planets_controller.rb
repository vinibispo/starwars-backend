class PlanetsController < ApplicationController
  include Pagy::Backend
  after_action { pagy_headers_merge(@pagy) if @pagy }
  def index
    @pagy, planets = pagy(Planet.all)
    render json: planets
  end
end
